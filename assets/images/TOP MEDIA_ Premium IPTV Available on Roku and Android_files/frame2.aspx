

   	for(var p in parent)
   	{
   		if(p.substr(0,10)=="MyLiveChat")
   		{
   			window[p]=parent[p];
   		}
   	}
	
   	window.MyLiveChat=parent.MyLiveChat;

   	var __cc_version=4.201;//3.1;
   	var __cc_urlbase=MyLiveChat.UrlBase;;


   	var UseHookupEventForMsnImages=true;

   	var Chat_Sync_Timeout=1500;//sync 1.0 times per second.
   	var chatservice_url=__cc_urlbase+"ChatAjax2.ashx";

   	var __cc_culture='en-US';

	var HCCID=MyLiveChat.HCCID;

	//var showjoinleavemsg=true;
	
	var LiveChatDialogCss="\x0D\x0A\x0D\x0A	.CustomerName\x0D\x0A	{\x0D\x0A		\x0D\x0A	}\x0D\x0A	.CustomerMessage .MessageText\x0D\x0A	{\x0D\x0A		\x0D\x0A	}\x0D\x0A\x0D\x0A	.OperatorName\x0D\x0A	{\x0D\x0A		\x0D\x0A	}\x0D\x0A	.OperatorMessage .MessageText\x0D\x0A	{\x0D\x0A		\x0D\x0A	}\x0D\x0A	\x0D\x0A	.CustomerMessage .Timestamp , .OperatorMessage .Timestamp\x0D\x0A	{\x0D\x0A		display:inline;\x0D\x0A		\x0D\x0A	}\x0D\x0A	\x0D\x0A	.SystemMessage , .Connection , .VarSupportMessage\x0D\x0A	{\x0D\x0A		\x0D\x0A	}\x0D\x0A\x0D\x0A	";
   
	var cohome=MyLiveChat.SourceUrl;

	var customerLicense='Free';
	var currentemail=null;
   	var placename="SupportSession:Guest:e996ff20-f48f-4df9-9783-5b87b527d708";
   	var promptwait=true;

	
   	var action_mode=null;

   	var CHATUI_DEBUG = false;

   	var CHATUI_MAX_MESSAGE_ITEM_COUNT = 500;

   	var TYPINGINTERNVAL = 2000;
   	var TYPINGDISPLAYTIME = 6000

   	