jQuery(function ($) {
    //Every tiny tools are implemented  in wooscHelper as global object literal.
    var wooscHelper = {
        ajax: function (data) {
            return jQuery.post(woosc_ajax_object.ajax_url, data);//Ajax url,Data

        },
        preLoader: function () {
            return '<div class="woosc-ajax-pre-loader-container" ><img  class="woosc-ajax-pre-loader" src="' + woosc_ajax_object.image_path + 'pre-loader.gif" alt="Loadding..." /></div>';
        },
        loadMorePreLoader: function () {
            return '<img  class="woosc-ajax-loadmore-pre-loader" src="' + woosc_ajax_object.image_path + 'load-more.gif" alt="Loadding..." />';
        },
    };

    $(document).ready(function (e) {

        /**
         * Shortcode KeyPress and button action.
         * 1.Enter KeyPress
         * 2.Click on Search button
         */
        $("#woosc-product-search-term").on("keypress", function (e) {
            if (e.which == 13 || e.keyCode == 13) {
                e.preventDefault();
                var keyWord = $(this).val().trim();
                var category = $("#woosc-categories-list").val().trim();
                var productContainer = $(this).parent().parent().parent().parent().find('.woosc-products-container');
                var WooSCWrapper = $(this).parent().parent().parent().parent();
                woosc_search_products(keyWord, category, productContainer, WooSCWrapper);
            }
        });

        $("#woosc-search-btn").on("click", function (e) {
            e.preventDefault();
            var keyWord = $("#woosc-product-search-term").val().trim();
            var category = $("#woosc-categories-list").val().trim();
            var productContainer = $(this).parent().parent().parent().parent().find('.woosc-products-container');
            var WooSCWrapper = $(this).parent().parent().parent().parent();
            woosc_search_products(keyWord, category, productContainer, WooSCWrapper);
        });

        //common api call function.

        function woosc_search_products(keyWord, category, productContainer, WooSCWrapper) {
            var template = WooSCWrapper.attr('data-template');
            var templateUrl = WooSCWrapper.attr('data-template-url');
            var pluginPath = WooSCWrapper.attr('data-plugin-path');
            $(".woosc-load-more-wrapper").hide();
            $('.woosc-products-container').html(wooscHelper.preLoader());
            var req_data = {
                'action': 'woosc_search_by_keyword',
                'keyword': keyWord,
                'category': category,
                'template': template,
                'template_url': templateUrl,
                'plugin_path': pluginPath,
            };
            var request = wooscHelper.ajax(req_data);
            request.done(function (response) {
                productContainer.html(response.html);
                //$('.woosc-products-container').html(response.html);
                if (response.product_num > response.offset) {
                    $(".woosc-load-more-wrapper").show();
                    $("#woosc-load-more-btn").attr('data-keyword', response.keyword);
                    $("#woosc-load-more-btn").attr('data-category', response.category);
                    $("#woosc-load-more-btn").attr('data-offset', response.offset);
                } else {
                    $(".woosc-load-more-wrapper").hide();
                }
            });
        }

        /***
         * Load More
         */
        $(document).on('click', '.woosc-load-more-btn', function (e) {
            e.preventDefault();
            var loadMoreBtn = $(this);
            var productContainer = loadMoreBtn.parent().parent().find('.woosc-products-container');
            loadMoreBtn.parent().prepend(wooscHelper.preLoader());
            $(".woosc-load-more-wrapper").css({'text-align': 'center'});
            var keyWord = loadMoreBtn.attr('data-keyword');
            var category = loadMoreBtn.attr('data-category');
            var offset = loadMoreBtn.attr('data-offset');
            var pluginPath = loadMoreBtn.parent().parent().attr('data-plugin-path');
            var templateUrl = loadMoreBtn.parent().parent().attr('data-template-url');
            var template = loadMoreBtn.parent().parent().attr('data-template');
            var req_data = {
                'action': 'woosc_search_by_keyword',
                'keyword': keyWord,
                'category': category,
                'offset': offset,
                'template': template,
                'template_url': templateUrl,
                'plugin_path': pluginPath,
            };
            var request = wooscHelper.ajax(req_data);
            request.done(function (response) {
                $('.woosc-ajax-pre-loader-container').remove();
                productContainer.append(response.html);
                //$('.woosc-products-container').append(response.html);
                if (response.product_num > response.offset) {
                    $(".woosc-load-more-wrapper").show();
                    loadMoreBtn.attr('data-keyword', response.keyword);
                    loadMoreBtn.attr('data-category', response.category);
                    loadMoreBtn.attr('data-offset', response.offset);
                } else {
                    $(".woosc-load-more-wrapper").hide();
                }
            });
        });
        //cart update animation
        jQuery('body').on('click', '.add_to_cart_button', function () {
            //event.preventDefault();
            jQuery(this).closest('.woosc-product').find('img').clone().addClass('animated-product-image').prependTo("#animated-product-image-box");

            //Product Animation Destination
            var cartPosX = jQuery('.woosc-floting-cart-trigger').offset().left;
            var cartPosY = jQuery('.woosc-floting-cart-trigger').offset().top;

            //Product Animation From
            var btnPosX = jQuery(this).closest('.woosc-product').find('.woosc-product-thumbnail').offset().left;
            var btnPosY = jQuery(this).closest('.woosc-product').find('.woosc-product-thumbnail').offset().top;
            jQuery('#animated-product-image-box').css({
                top: btnPosY,
                left: btnPosX,
            });

            function buttonposition() {
                jQuery('#animated-product-image-box').css({
                    'top': btnPosY,
                    'left': btnPosX,
                });
            }

            jQuery("#animated-product-image-box").animate({
                top: cartPosY,
                left: cartPosX,
            }, 900);
            setTimeout(function () {
                buttonposition();
                jQuery("#animated-product-image-box img").fadeOut();
            }, 500);

            //Animate product-floting-cart-trigger
            jQuery(".woosc-floting-cart-trigger").addClass("new-product-item-added");

            //Reset Animate product-floting-cart-trigger
            setTimeout(function () {
                jQuery(".woosc-floting-cart-trigger").removeClass("new-product-item-added");
            }, 1000);


        });

        jQuery('.woosc-floting-cart-trigger').click(function () {
            $('.woosc-floating-cart').toggleClass("woosc-floating-cart-activated");
            $(this).toggleClass("woosc-floting-cart-trigger-activated");
        });

        /*
         *Searchable Select
         */
        //jQuery(".woosc-categories-list").chosen();

        /*
         *Searchable Select
         */
        var wooscContainer = jQuery(".woosc-container");
        var wooscContainerWidth = wooscContainer.outerWidth();

        if (wooscContainerWidth > 900) {
            wooscContainer.addClass("woosc-large-container").removeClass("woosc-medium-container").removeClass("woosc-small-container").removeClass("woosc-extra-small-container");
        } else if (wooscContainerWidth < 900 && 768 < wooscContainerWidth) {
            wooscContainer.addClass("woosc-medium-container").removeClass("woosc-large-container").removeClass("woosc-small-container").removeClass("woosc-extra-small-container");
        } else if (wooscContainerWidth < 767 && 500 < wooscContainerWidth) {
            wooscContainer.addClass("woosc-small-container").removeClass("woosc-large-container").removeClass("woosc-medium-container").removeClass("woosc-extra-small-container");
        } else {
            wooscContainer.addClass("woosc-extra-small-container").removeClass("woosc-large-container").removeClass("woosc-medium-container").removeClass("woosc-small-container");
        }


        $(window).resize(function () {
            var wooscContainerWidth = wooscContainer.outerWidth();
            if (wooscContainerWidth > 900) {
                wooscContainer.addClass("woosc-large-container").removeClass("woosc-medium-container").removeClass("woosc-small-container").removeClass("woosc-extra-small-container");
            } else if (wooscContainerWidth < 900 && 768 < wooscContainerWidth) {
                wooscContainer.addClass("woosc-medium-container").removeClass("woosc-large-container").removeClass("woosc-small-container").removeClass("woosc-extra-small-container");
            } else if (wooscContainerWidth < 767 && 500 < wooscContainerWidth) {
                wooscContainer.addClass("woosc-small-container").removeClass("woosc-large-container").removeClass("woosc-medium-container").removeClass("woosc-extra-small-container");
            } else {
                wooscContainer.addClass("woosc-extra-small-container").removeClass("woosc-large-container").removeClass("woosc-medium-container").removeClass("woosc-small-container");
            }

        });


    });

});
