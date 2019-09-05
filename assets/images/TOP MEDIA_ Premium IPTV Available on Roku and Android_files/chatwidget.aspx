

   	// livechat by www.mylivechat.com/  2018-06-12

   	
	   // first loading
	   if (typeof (MyLiveChat) == "undefined") {
		   MyLiveChat = {};
		   MyLiveChat.RawConfig ={InPageUseBubbleTopOnlineOnly:"1",UIPopupMode:"Modern",WidgetHideWidget:"",InviteHideTimeout:"1800",WidgetOnlineImage:"1",RoutingNoWait:"",InvitePlaySound:"1",InviteTemplate:"4",UIMobileMode:"Inline",WidgetHideInline:"",InlineChatTimestampVisible:"1",InlineChatBubbleUIMode:"1",InviteHeadline:"Chat Invitation",InviteSoundFile:"1",InPageTemplate:"2",InPageImageOffline:"1",InlineChatBackColor:"#ffffff",InviteAcceptTooltip:"Chat Invitation",InPageUseBubbleTop:"1",LS_ShowAllCustomers:"Strict",WebConsoleRedirectTime:"637003557374431417",WidgetOpenNewWindow:"True",InlineChatIntroColor:"#000000",InlineChatIntroSize:"14px",InvitePhoto:"4",ButtonOpenNewWindow:"True",InPageTemplateMobile:"",InlineChatHideSubject:"1",WidgetStartPos:"middleright",UIDialogMode:"Classic",InlineChatOfflineLogo:"a2",InviteMessage:"Hello, my name is (AGENT). How can I help you today?",InlineChatIntroFont:"Open Sans",InPageBubbleTop:"5",InlineChatTextColor:"#000000",InlineChatOnlineLogo:"a2",InviteRejectTooltip:"Close",WidgetPosition:"middleright",InlineChatWaitingFieldDepartment:"0",WidgetFixedMode:"",InPageImageOnline:"1"};
		   MyLiveChat.RawQuery ={hccid:"76686081",apimode:"chatwidget"};
		   for (var mlcp in MyLiveChat.RawConfig) {
			   MyLiveChat[mlcp] = MyLiveChat.RawConfig[mlcp];
		   }
		   for (var mlcp in MyLiveChat.RawQuery) {
			   MyLiveChat[mlcp] = MyLiveChat.RawQuery[mlcp];
		   }

		   MyLiveChat.HCCID ='76686081';
		   MyLiveChat.PageBeginTime = new Date().getTime();
		   MyLiveChat.LoadingHandlers = [];
		   //	,"Departments"
		   MyLiveChat.CPRFIELDS = ["SyncType", "SyncStatus", "SyncResult", "HasReadyAgents", "VisitorUrls", "VisitorStatus", "VisitorDuration", "VisitorEntryUrl", "VisitorReferUrl"];
	   }
	   else {
		   MyLiveChat.MultiLinked = true;
	   }
	


	   MyLiveChat.Version =3006;
	   MyLiveChat.FirstRequestTimeout =21600;
	   MyLiveChat.NextRequestTimeout =43200;
	   MyLiveChat.SyncType =null;
	   MyLiveChat.SyncStatus ="LOADING";
	   MyLiveChat.SyncUserName =null;
	   MyLiveChat.SyncResult ="LOADING";
	   MyLiveChat.HasReadyAgents =false;
	   MyLiveChat.SourceUrl ="https://mixiptv.com/top-media/";
	   MyLiveChat.AgentTimeZone = parseInt("-7" || "-5");
	   MyLiveChat.VisitorStatus ="";
	   MyLiveChat.UrlBase ="https://s7.mylivechat.com/livechat2/";
	   MyLiveChat.SiteUrl ="https://s7.mylivechat.com/";

   	

	   if (!MyLiveChat.AgentId) MyLiveChat.AgentId = MyLiveChat.RawAgentId;

	   MyLiveChat.Departments = [];

	   MyLiveChat.Departments.push({
		   Name:"Sales/Ventas",
		   Agents: [{
			   Id:'User:1',
			   Name:"Rosa López",
			   Online:false
   			},{
			   Id:'User:11',
			   Name:"Jason Steward",
			   Online:false
   			},{
			   Id:'User:12',
			   Name:"Mike Hall",
			   Online:false
   			}],
		   Online:false
   		});

	   MyLiveChat.Departments.push({
		   Name:"Support/Soporte",
		   Agents: [{
			   Id:'User:1',
			   Name:"Rosa López",
			   Online:false
   			},{
			   Id:'User:11',
			   Name:"Jason Steward",
			   Online:false
   			},{
			   Id:'User:12',
			   Name:"Mike Hall",
			   Online:false
   			}],
		   Online:false
   		});



	   MyLiveChat.VisitorUrls = [];



   	

	   function MyLiveChat_AddScript(tag) {
		   var func = MyLiveChat_AddScript;
		   var arr = func._list;
		   if (!arr) func._list = arr = [];
		   if (func._loading) {
			   arr.push(tag);
			   return;
		   }
		   function ontagload() {
			   func._loading = false;
			   if (!arr.length) return;
			   tag = arr.shift();
			   LoadTag();
		   }
		   function LoadTag() {
			   func._loading = true;
			   if ('onload' in tag) {
				   tag.onload = ontagload;
			   }
			   else {
				   var iid = setInterval(function () {
					   if (tag.readyState != 'complete' && tag.readyState != 'loaded')
						   return;
					   clearInterval(iid);
					   ontagload();
				   }, 10);
			   }
			   var p = document.getElementsByTagName("head")[0] || document.body;
			   p.insertBefore(tag, p.firstChild);
		   }
		   LoadTag();
	   }

	   function MyLiveChat_GetLastScriptTag() {
		   var coll = document.getElementsByTagName("script");
		   return coll[coll.length - 1];
	   }
	   function MyLiveChat_ImportCss(url) {
		   var p = document.head || document.getElementsByTagName("head")[0] || document.body;
		   var tag = document.createElement("link");
		   tag.setAttribute("rel", "stylesheet");
		   tag.setAttribute("href", url);
		   p.insertBefore(tag, p.firstChild);
	   }
	   function MyLiveChat_DocWrite(html, relativetag) {
		   if (html.substr(0, 7) == "<script")	//Low IE interactive or defer
		   {
			   var src = html.match(/src=["']?([^"'>]*)["']/)[1];
			   if (!MyLiveChat.LoadedScripts) MyLiveChat.LoadedScripts = {};
			   if (MyLiveChat.LoadedScripts[src]) return;
			   MyLiveChat.LoadedScripts[src] = true;

			   var tag = document.createElement("script");
			   tag.setAttribute("src", src);
			   MyLiveChat_AddScript(tag);
		   }
		   else {
			   if (!document.body || document.readyState == "loading") {
				   document.write(html);
				   return;
			   }

			   if (!relativetag) relativetag = MyLiveChat_GetLastScriptTag();
			   var div = document.createElement("DIV");
			   div.innerHTML = html;
			   while (true) {
				   var c = div.firstChild;
				   if (!c) break;
				   div.removeChild(c);
				   relativetag.parentNode.insertBefore(c, relativetag);
			   }
		   }
	   }

	   MyLiveChat.NewGuid = function () {
		   var guid = "";
		   for (var i = 1; i <= 32; i++) {
			   guid += Math.floor(Math.random() * 16.0).toString(16);
			   if (i == 8 || i == 12 || i == 16 || i == 20) guid += "-";
		   }
		   return guid;
	   }
	   
   	MyLiveChat.RandomID='6569ab58-85fb-82a8-3f32-d97f4d30d708';

   	

	   MyLiveChat.VisitorDuration = 0;
	   MyLiveChat.VisitorEntryUrl = "";
	   MyLiveChat.VisitorReferUrl = "";

	   MyLiveChat.ShowButton =true;
	   MyLiveChat.ShowLink =true;
	   MyLiveChat.ShowBox =true;
	   MyLiveChat.ShowSmart =false;


	   MyLiveChat.NoPrivateLabel =true;


	   MyLiveChat.LoadingHandlers.push(function (funcself) {
		   MyLiveChat_RunLoadingHandler('chatwidget', funcself);
	   });

	   MyLiveChat.ResourcesVary ="\x26culture=en-US\x26mlcv=3006\x26template=2";

   	

   	

	   MyLiveChat['chatwidget' + "_script_tag"] = MyLiveChat_GetLastScriptTag();

	   if (typeof (MyLiveChat_Initialize) != "undefined") {
		   MyLiveChat_Initialize()
	   }
	   else if (!MyLiveChat.MultiLinked) {
		   MyLiveChat_ImportCss(MyLiveChat.UrlBase + "chatinline.css");
		   MyLiveChat_DocWrite("<script defer='defer' src='" + MyLiveChat.UrlBase + "resources2.aspx?HCCID=" + MyLiveChat.HCCID + MyLiveChat.ResourcesVary + "'></scr" + "ipt>");
		   MyLiveChat_DocWrite("<script defer='defer' src='" + MyLiveChat.UrlBase + "script/livechatinit2.js'></scr" + "ipt>");
	   }


   	