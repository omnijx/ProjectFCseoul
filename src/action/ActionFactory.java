package action;

public class ActionFactory {
	private ActionFactory() {}
	private static ActionFactory instance = new ActionFactory();
	public static ActionFactory getInstance() {
		return instance;
	}
	public Action getEShop(String command) {
		Action action = null;
		
		switch(command) {
		// 황재웅
		case "main" :
			action = new EShopMainAction();
			break;
		case "catePage" :
			action = new EShopCatePageAction();
			break;
		case "detailPage" :
			action = new EShopDetailAction();
			break;
		case "myPage" :
			action = new EShopMyPageAction();
			break;
		case "cart" :
			action = new EShopCartAction();
			break;
		case "orderHistory" :
			action = new EShopOrderHistoryAction();
			break;
		case "wishList" :
			action = new EShopWishListAction();
			break;
		case "buy" :
			action = new EShopBuyAction();
			break;
		case "buyCheck" :
			action = new EShopBuyCheckAction();
			break;
		case "buySuccess" :
			action = new EShopBuySuccessAction();
			break;
		case "orderTracking" :
			action = new EShopOrderTrackingAction();
			break;
		case "updateAction" :
			action = new EShopUpdateAction();
			break;
		case "enotice" :
			action = new EShopNoticeAction();
			break;
		case "FAQ" :
			action = new EShopFAQAction();
			break;
		case "EQA" :
			action = new EShopQAAction();
			break;
		case "terms" :
			action = new EShopTermsAction();
			break;
		case "privacy" :
			action = new EShopPrivacyAction();
			break;
		case "socialBoard" :
			action = new SocialBoardAction();
			break;
		case "socialBoardDetail" :
			action = new SocialBoardDetailAction();
			break;
		case "socialWrite" :
			action = new SocialWriteAction();
			break;
		case "socialUpdate" :
			action = new SocialBoardUpdateAction();
			break;
		case "socialDelete" :
			action = new SocialBoardDeleteAction();
			break;
		case "socialUpdatePage" :
			action = new SocialBoardUpdatePageAction();
			break;
		// 남태원	
		case "fcSeoulMain" :
			action = new FcSeoulMainAction();
			break;
		case "QA": 
			action = new QAMainAction();
			break;
		case "QADetail" :
			action = new QADetailAction();
			break;
		case "QAWriteForm" :
			action = new QAWriteFormAction();
			break;
		case "QAWriteAction":
			action = new QAWriteAction();
			break;
		case "QADelete" :
			action = new QADeleteAction();
			break;
		case "QAAnswerForm":
			action = new QaAnswerFormAction();
			break;
		case "QAAnswerWriteAction":
			action = new QaAnswerWriteAction();
			break;
		case "QAUpdateform":
			action = new QAUpdateFormAction();
			break;
		case "QAUpdate":
			action = new QAUpdateAction();
			break;
		case "clubIntro" :
			action = new ClubIntroAction();
			break;
		case "clubIntro2" :
			action = new ClubIntroAction2();
			break;
		case "clubIntro3" :
			action = new ClubIntroAction3();
			break;
		case "clubIntro4" :
			action = new ClubIntroAction4();
			break;
		case "clubIntro4Music" :
			action = new ClubIntroMusicAction4();
			break;
		case "clubIntro4Suport" :
			action = new ClubIntroSuportAction4();
			break;
		case "clubIntro5" :
			action = new ClubIntroAction5();
			break;
		case "clubIntro6" :
			action = new ClubIntroAction6();
			break;
		case "clubIntro7" :
			action = new ClubIntroAction7();
			break;
		case "clubIntro8" :
			action = new ClubIntroAction8();
			break;
		case "officialSNS" :
			action = new OfficialSNSAction();
			break;
		// 최진혁
		case "photo": action = new PhotoMainAction(); break;
		case "photoDetail": action = new PhotoDetailAction(); break;
		case "notice": action = new NoticeMainAction(); break;
		case "noticeDetail": action = new NoticeDetailAction(); break;
		case "noticeWritePage": action = new NoticeWritePageAction(); break;
		case "noticeWrite": action = new NoticeWriteAction(); break;
		case "noticeDelete": action = new NoticeDeleteAction(); break;
		case "noticeUpdatePage": action = new NoticeUpdatePageAction(); break;
		case "noticeUpdate": action = new NoticeUpdateAction(); break;
		case "login": action = new LoginmainAction(); break;
		case "loginAction": action = new LoginAction(); break;
		case "logout": action = new LogoutAction(); break;
		case "join1": action = new Join1Action(); break;
		case "join2": action = new Join2Action(); break;
		case "join3": action = new Join3Action(); break;
		case "join4": action = new Join4Action(); break;
		case "register": action = new JoinRegisterAction(); break;
		case "idCheck": action = new IdCheckAction(); break;
		case "nickCheck": action = new NickCheckAction(); break;
		case "fcmyPage": action = new MyPageAction(); break;
		case "memberCheckUpdate": action = new MemberCheckAction(); break;
		case "memberPass": action = new MemberPassAction(); break;
		case "updatePage": action = new UpdatePageAction(); break;
		case "memberUpdatePage": action = new MemberUpdatePageAction(); break;
		case "memberCheckSecession": action = new MemberSecessionPageAction(); break;
		case "memberPassSecession": action = new MemberSecessionAction(); break;
		// 김하진
		case "faq" :
			action = new faqAction();
			break;
		case "ticketing" :
			action = new ticketingAction();
			break;
		case "teamMember" :
			action = new TeamMemberAction();
			break;
		case "news" :
			action = new NewsAction();
			break;
		case "newsDetail" :
			action = new NewsDetailAction();
			break;
		case "news2" :
			action = new News2Action();
			break;
		case "newsDetail2" :
			action = new NewsDetail2Action();
			break;
		case "newsWrite" :
			action = new NewsWrite();
			break;
		case "matchInfo" :
			action = new MatchInfoAction();
			break;
		case "matchInfo2" :
			action = new MatchInfoAction2();
			break;
		case "matchInfo3" :
			action = new MatchInfoAction3();
			break;
		case "matchInfoResult" :
			action = new MatchInfoResultAction();
			break;
		case "matchInfoPrev" :
			action = new PrevMatchInfoAction();
			break;
		case "rankingScore" :
			action = new rankingScoreAction();
			break;
		case "rankingHelpList" :
			action = new rankingHelpAction();
			break;
		case "rankingList" :
			action = new rankingListAction();
			break;
		}
		
		return action;
	}
}
