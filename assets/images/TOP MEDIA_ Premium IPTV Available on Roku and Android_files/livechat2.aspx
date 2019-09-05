

   	// livechat by www.mylivechat.com/  2018-06-12

   	


	   MyLiveChat.Version =3006;
	   MyLiveChat.FirstRequestTimeout =21600;
	   MyLiveChat.NextRequestTimeout =43200;
	   MyLiveChat.SyncType ="VISIT";
	   MyLiveChat.SyncStatus ="READY";
	   MyLiveChat.SyncUserName ="Guest_e996ff20";
	   MyLiveChat.SyncResult =null;
	   MyLiveChat.HasReadyAgents =false;
	   MyLiveChat.SourceUrl ="https://mixiptv.com/top-media/";
	   MyLiveChat.AgentTimeZone = parseInt("-7" || "-5");
	   MyLiveChat.VisitorStatus ="VISIT";
	   MyLiveChat.UrlBase ="https://a7.mylivechat.com/livechat2/";
	   MyLiveChat.SiteUrl ="https://a7.mylivechat.com/";

   	

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



   	


	   MyLiveChat.VisitorLocation ="US|United States|PA|Pennsylvania|Reading";
	   MyLiveChat.LastLoadTime = new Date().getTime();
	   MyLiveChat.VisitorDuration =101;
	   MyLiveChat.VisitorEntryUrl ="https://mixiptv.com/top-media/";
	   MyLiveChat.VisitorReferUrl =null;

	   MyLiveChat.VisitorUrls = [];



   	
	   MyLiveChat.VisitorUrls.push("https://mixiptv.com/top-media/");
   	

	   MyLiveChat_Initialize();

	   if (MyLiveChat.localStorage || MyLiveChat.userDataBehavior) {
		   MyLiveChat_SyncToCPR();
	   }

   	