GameProvisionMediator = class("GameProvisionMediator", DmPopupViewMediator, _M)

GameProvisionMediator:has("_loginSystem", {
	is = "r"
}):injectWith("LoginSystem")

local kBtnHandlers = {}
local left_text = [[
게임 서비스 이용약관 (광고성 PUSH 수신동의 포함)

제 1조 목적
본 서비스 이용약관(이하 “약관”이라 함)은 (주)창유닷컴코리아(이하 "회사"라 함)가 스마트 기기를 통해 제공하는 게임 및 제반 서비스(이하 "서비스"라 합니다)의 이용과 관련하여 회사와 “회원” 간의 권리, 의무 및 기타 필요한 제반 사항을 규정함을 목적으로 합니다.

제 2조 용어의 정의
1) 본 약관에서 사용하는 주요 용어의 정의는 아래와 같습니다.
① “회사”라 함은 유선 및 무선통신망 등을 통하여 “서비스”를 제공하는 사업자인 창유닷컴코리아를 말합니다.
② “회원”이라 함은 본 약관 및 개인정보 제공에 동의하고 “회사”가 제공하는 모든 “서비스”를 이용하는 “회원”를 말합니다.
③ “콘텐츠”라 함은 “회사”가 제공하는 “서비스”와 관계되어 제작, “회원”에게 제공되는 내용물 일체를 말합니다.
④ “서비스”라 함은 “회사”가 커뮤니티, 유선 및 무선통신망 등을 통하여 “회원”에게 제공하는 게임 서비스, 고객지원, 정보제공 및 기타 제반 서비스 등을 말합니다.
⑤ “제휴 서비스”라 함은 카카오 등 모바일 플랫폼 서비스 사 및 페이스북 등 소셜네트워크 서비스사와의 제휴를 통하여 “회원”에게 제공하는 일체의 “서비스”를 말합니다.
⑥ “아이템”이란 게임 내에서 사용할 수 있는 상품, 교환 수단, 게임 내 머니, 이용권, 기타 일정 또한 랜덤하게 결과값을 나타낼 수 있도록 하는 데이터 또는 이를 인식 가능하게 표현한 것을 의미합니다.
⑦ “계정(ID)”이라 함은 “회원”의 식별과 서비스 이용을 위하여 “회원”이 선정하고 플랫폼 인증으로 부여한 문자 또는 숫자의 조합을 말합니다.
2) 본 약관에서 사용하는 용어의 정의는 본 조 1항에서 정의한 것을 제외하고는 관계법령 및 일반적인 기타 상관례에 의합니다.

제 3조 약관의 효력 및 변경
1) “회사”는 본 약관의 내용을 “회원”이 쉽게 알 수 있도록 서비스 초기 화면 또는 연결 화면을 통해 게시합니다.
2) 합리적인 사유가 발생할 경우, “회사”는 「전자상거래 등에서의 소비자 보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「게임산업진흥에 관한 법률」, 「정보 통신망 이용 촉진 및 정보보호 등에 관한 법률」, 「콘텐츠 산업 진흥법」 등 관계법령에 위배되지 않는 범위 내에서 본 약관을 개정할 수 있습니다.
3) “회사”가 본 약관을 개정하는 경우, 적용일자 및 개정 내용, 개정 사유 등을 명시하여 적용 일자로부터 최소 7일이전(“회원”에게 불리한 내용의 경우에는 30일이상)부터 적용일자 전일까지 현행 약관과 함께 서비스 내 공지사항을 통해 사전 공지하거나 서비스 초기 화면 또는 별도의 연결 화면, 쪽지 등 가능한 전자적 수단을 통해 따로 명확히 통지할 수 있습니다.
4) 이 약관에 동의하는 것은 정기적으로 서비스 페이지를 방문하여 약관의 변경 사항을 확인하는 것에 동의함을 의미합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 “회원”의 피해는 “회사”에서 책임지지 않습니다.
5) “회원”은 변경된 약관에 동의하지 않을 권리가 있으며, 이 경우 “서비스” 이용을 중단하고 탈퇴할 수 있습니다. 다만 변경된 약관의 효력 발생일 이후에도 “서비스”를 계속 사용할 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.
6) “회원”은 “회사”의 약관 이용에 최초 1회 동의 이후 “회사”가 제공하는 “서비스” 및 “콘텐츠”를 별도의 동의 없이 이용할 수 있으나, 별도의 법령에서 정하는 바에 따라 본인 확인 및 동의절차를 거쳐야 할 경우 일부 “서비스”에서 관련 절차를 진행할 수 있습니다.
7) 본 약관은 “회사”가 필요에 의하여 제공하는 개별 서비스의 별도 정책과 함께 적용될 수 있으며, 명시되지 아니한 사항과 약관의 해석에 관하여는 관계 법령 또는 상관례에 의합니다.

제 4조 서비스 이용계약의 성립
1) “회원”이 “회사”가 제공하는 “서비스”를 이용하고자 할 경우, 서비스 초기 화면 또는 연결 화면을 통해 제공되는 이용약관을 읽고 동의하는 이용신청 절차가 필요합니다.
2) “회원”은 이용신청 시 “회사”에서 요구하는 제반 정보를 제공해야 합니다.
3) “회원”은 이용신청 시 본인의 실명 및 식별 정보를 정확히 기재해야 하며, 허위 기재 또는 타인의 명의 도용 시 “회사”에 약관에 의한 권리를 주장할 수 없습니다. 또한 이 경우 “회사”는 “회원”과의 이용계약을 환급 없이 취소하거나 해지할 수 있습니다. 

제 5조 이용신청의 승낙과 제한
1) “회사”는 “회원”이 본 약관의 내용에 동의하고 적합한 제반 정보를 제공하여 이용 신청을 한 경우, 상당한 거부사유가 없는 한 “서비스” 이용신청을 승낙합니다.
2) “회사”는 아래 사항에 해당되는 경우에 대해서는 “서비스” 이용을 승낙하지 않거나 제한할 수 있습니다.
① 타인의 명의, 전화번호 및 스마트 기기를 도용한 경우
② 이용 신청 시 필요한 제반 정보를 허위로 기재한 경우
③ 형법에서 규정한 범죄 행위의 목적으로 “서비스”를 이용하고자 하는 경우
④ 청소년보호법의 취지에 위배되는 목적으로 “서비스”를 이용하고자 하는 경우
⑤ 「게임산업진흥에 관한 법률」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 및 기타 현행 법령에 위배되는 목적으로 “서비스”를 이용하고자 하는 경우
⑥ 영리를 추구할 목적으로 “서비스”를 이용하고자 하는 경우
⑦ 본 “서비스”와 경쟁 관계에 있는 “회원”이 “회사”의 이익을 저해하려는 목적으로 신청하는 경우
⑧ 대한민국 이외의 국가 중 “서비스”를 제공할 것으로 결정하지 않은 국가의 접속 “회원”에 대한 서비스 제공과 관련하여 제한이 필요할 경우
⑨ 기타 “회사”가 규정한 제반 사항을 위반하며 신청하는 경우
3) “회사”는 다음 각 호에 해당하는 경우에는 그 사유가 해소될 때까지 “서비스” 이용 신청 승낙을 유보할 수 있습니다.
① “회사”의 설비의 여유가 없거나 기술적 장애가 있는 경우
② “서비스” 상의 장애 또는 “유료콘텐츠” 결제수단의 장애가 발생한 경우
③ 기타 “회사”의 사정으로 이용 승낙이 곤란한 경우

제 6조 회원 정보의 제공 및 변경
1) “회원”은 본 약관에 의하여 “회사”에 정보를 제공하여야 하는 경우에는 진실된 정보를 제공하여야 하며, 허위 정보 제공으로 인해 발생한 불이익에 대해서는 보호받지 못합니다.
2) “회원”은 회원정보 관리화면을 통하여 자신의 정보를 열람하거나 수정하는 것이 가능합니다. 다만 서비스 관리를 위해 필요한 실명과 계정(ID) 등은 수정할 수 없습니다.
3) “회원”은 이용 신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 기타 방법으로 “회사”에 그 변경 사항을 알려야 합니다.
4) “회원”이 제 6조 3항의 정보 변경 사항을 수정하지 않거나 “회사”에 알리지 않아 발생한 불이익에 대하여 “회사”는 일체 책임지지 않으며, 위 사유로 발생되는 손해는 “회원”의 책임으로 해결해야 합니다.

제 7조 회원 정보의 보호 및 사용
1) “회사”는 관계 법령이 정하는 바에 따라 계정정보를 포함한 “회원”의 개인정보를 보호하기 위해 노력하며, 개인정보의 보호 및 사용에 대해서는 관계법령 및 “회사”와 “제휴 서비스”에서 별도로 고지하는 개인정보 취급방침이 적용됩니다. 다만 “회사”에서 공식적으로 제공하는 “서비스” 이외의 부분에서는 해당 사항이 적용되지 않습니다.
2) “회사”는 “회원”의 귀책사유로 인하여 노출된 “회원”의 계정정보를 포함한 모든 정보에 대해서 일체의 책임을 지지 않습니다.
3) “회사”는 관계법령에 의해 관련 국가기관 등의 요구가 있는 경우가 아닌 이상, “회원”의 개인정보를 본인의 승낙 없이 타인에게 제공하지 않습니다.
4) “회사”는 본인확인을 위해 필요한 경우, “회원”에게 사유 및 용도와 보관 기간을 명확히 고지하고 “회원”의 신분증 사본 등의 본인확인이 가능한 증서를 요구할 수 있습니다. “회사”는 고지한 목적 이외에 이를 이용할 수 없으며, 고지한 목적 달성 및 보관 기간이 지나면 즉시 파기합니다.
5) 서비스의 특성에 따라 “회원”에게 입력 받은 별명, 사진 등 자신을 소개하는 내용이 다른 “회원”에게 공개될 수 있습니다.

제 8조 회사의 의무
1) "회사"는 관련 법령과 본 약관을 신의에 따라 성실하게 준수하고, “회원”에게 지속적이고 안정적으로 “서비스”를 제공하기 위하여 최선을 다하여 노력합니다.
2) "회사"는 “회원”이 안전하게 “서비스”를 이용할 수 있도록 개인정보 보호를 위한 보안시스템을 갖추어야 하며, 개인정보 취급방침을 공시하고 준수합니다. 또한 본 약관 및 개인정보 취급방침에서 정한 경우를 제외하고는 “회원”의 개인정보가 제 3자에게 공개 또는 제공되지 않도록 합니다.
3) "회사"는 “회원”으로부터 제기되는 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 적절한 절차를 거쳐 즉시 처리하여야 합니다. 다만 즉시 처리가 어려운 경우에는 “회원”에게 사유와 처리 일정을 통보하여야 합니다.
4) “회사”는 “회원”의 권익을 보호하고 “서비스” 내 질서를 유지할 수 있도록 합니다.

제 9조 회원의 의무
1) “회원”은 본 약관에서 규정하는 사항, 운영정책 및 이용제한 규정, 기타 “회사”가 정한 제반 규정, 공지사항, 관계법령을 준수하여야 합니다. “회원”이 청소년 보호법 등 관계 법령을 위반한 경우에는 해당 법령에 의거 처벌을 받을 수 있습니다.
2) “회원”은 “회사”의 업무에 방해가 되는 행위 또는 “회사”의 명예를 손상시키는 행위를 해서는 안됩니다.
3) “회원”은 “회사”에서 공식적으로 인정한 경우를 제외하고 “서비스”를 이용하여 영업 활동을 할 수 없으며, 이를 위반하고 진행한 영업 활동으로 인해 발생한 결과 및 손실에 대한 책임은 “회원”에게 있습니다. 이와 같은 영업 활동으로 “회사”에 손해를 끼칠 경우, “회사”는 “회원”에게 서비스 이용 제한 및 적법한 절차를 거쳐 손해배상 등을 청구할 수 있습니다.
4) “회원”의 계정(ID)과 스마트 기기에 관한 관리책임은 “회원”에게 있으며, 이를 제 3자가 이용하도록 하여서는 안됩니다. “회원” 스스로의 관리 부실로 인해 발생하는 손해에 대해서는 “회사”는 책임지지 않습니다.

제 10조 서비스의 이용
1) “회사”는 본 “서비스” 이용 희망자의 전용 애플리케이션 다운로드, 설치, 네트워크를 통한 이용신청 또는 게임파워 회원 인증 즉시 “서비스”를 개시합니다. 단, “회사”의 업무상 또는 기술상의 장애로 인하여 “서비스”를 개시하지 못하는 경우, “서비스” 상에 공지하거나 “회원”에게 즉시 이를 통지합니다.
2) “회사”는 스마트 기기를 위한 전용 애플리케이션 또는 네트워크를 이용하여 “서비스”를 제공하며, “회원”은 애플리케이션을 다운로드하여 설치하거나 네트워크를 이용하여 무료 또는 유료로 서비스를 이용할 수 있습니다.
3) 유료 서비스의 경우 해당 서비스에 명시된 요금을 지불하여야 사용 가능하며 네트워크를 통해 애플리케이션 다운로드 또는 “서비스”를 이용하는 경우 가입한 이동통신사에서 정한 별도의 요금이 발생할 수 있습니다.
4) 다운로드하여 설치한 애플리케이션 또는 네트워크 서비스를 통해 이용하는 서비스의 경우 스마트 기기 또는 이동통신사의 특성에 맞도록 제공되며 스마트 기기의 변경, 번호 변경 및 해외 로밍의 경우 콘텐츠의 전부 또는 일부 기능을 이용할 수 없으며 이 경우 회사는 어떠한 책임도 부담하지 않습니다.

제 11조 서비스의 변경 및 중지
1) “회사”는 시스템 점검, 증설 및 교체 등 부득이한 사유로 인하여 “서비스”를 중단할 수 있으며 “서비스” 상을 통해 “회원”에게 사전 고지합니다. 단 치명적인 결함 및 긴급한 보안문제 등 사전에 통지할 수 없는 부득이한 사정이 있는 경우는 사후에 통지를 할 수 있습니다.
2) “회사”는 새로운 콘텐츠, 콘텐츠의 내용(아이템, 경험치, 게임 내 머니 등)이 운영상, 기술상 필요한 경우 “서비스”의 전부 또는 일부를 사전 공지 후 수정할 수 있습니다. 단, 부득이한 사유가 있는 경우에는 사후 공지할 수 있습니다.
3) “회원”은 “서비스”의 종료 시 사용기간이 남아있지 않은 “유료아이템”에 대해 보상을 청구할 수 없습니다. 사용기간이 표시되지 않은 “유료아이템”의 경우, “서비스” 중단 공지 시 공지된 “서비스”의 종료일까지를 “유료아이템”의 사용 기간으로 봅니다.
4) “회사”는 시장의 변화, 기술적 결함, 서비스 “회원”의 선호 감소 및 기타 게임의 기획이나 운영상 또는 회사의 긴박한 상황 등에 의해 “서비스” 전부를 중단할 경우 30일전에 “서비스” 상이나 커뮤니티를 통해 이를 공지하고 “서비스”의 제공을 중단할 수 있습니다. 단 “회사”가 통제할 수 없는 부득이한 사유로 사전 공지가 불가능한 경우에는 사후에 공지를 할 수 있습니다.

제 12조 서비스 이용제한
1) “회원”은 다음 각 호에 해당하는 행위를 하여서는 안되며, 해당 행위를 하는 경우에 “회사”는 행위의 종류 및 사안의 경중에 따라 “회원”의 “서비스”에 대하여 전체 또는 일부의 이용제한 조치를 할 수 있습니다. “회사”는 이용제한 조치된 “회원”의 관련 정보(글, 사진, 영상 등) 삭제 및 적법한 조치를 포함한 이용제한 조치를 취할 수 있으며, 그로 인해 발생한 문제의 책임은 “회원” 본인에게 있습니다.
① 각종 신청, 변경, 등록 시 허위의 내용을 등록하거나, 타인을 기망하는 행위
② 타인의 정보를 도용한 행위
③ “회사”로부터 특별한 권리를 받지 않고 “회사”의 프로그램을 변경하거나, “회사”의 서버를 해킹하거나 웹사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 변경하거나, “회사”의 “서비스”를 비정상적인 방법으로 사용하는 행위
④ 회사 프로그램상의 버그를 악용하는 행위
⑤ 정상적이지 아니한 방법으로 사이버 자산(ID, 캐릭터, 아이템, 게임 내 머니 등)을 취득, 양도 또는 매매하는 행위
⑥ “서비스”에 위해를 가하거나 “서비스”를 고의로 방해하는 행위
⑦ “회사”의 사전 승낙 없이 “서비스”를 이용하여 영업활동을 하는 행위
⑧ 본 서비스를 통해 얻은 정보를 “회사”의 사전 승낙 없이 서비스 이용 외의 목적으로 복제하거나, 이를 출판 및 방송 등에 사용하거나, 제3자에게 제공하는 행위
⑨ 타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을 전송, 게시 또는 기타의 방법으로 타인에게 유포하는 행위
⑩ 청소년보호법 또는 법에 위반되는 저속, 음란한 내용의 정보, 문장, 도형, 음향, 동영상을 전송, 게시 또는 기타의 방법으로 타인에게 유포하는 행위
⑪ 심히 모욕적이거나 개인신상에 대한 내용이어서 타인의 명예나 프라이버시를 침해할 수 있는 내용을 전송, 게시 또는 기타의 방법으로 타인에게 유포하는 행위
⑫ 다른 “회원”을 희롱 또는 위협하거나 특정 “회원”에게 지속적으로 고통 또는 불편을 주는 행위
⑬ “회사”의 승인을 받지 않고 다른 “회원”의 개인정보를 수집 또는 저장하는 행위
⑭ 범죄와 결부된다고 객관적으로 판단되는 행위
⑮ 기타 관계 법령에 위배되는 행위

제 13조 잠정조치로서의 이용제한
1) “회사”는 다음 각 호에 해당하는 문제에 대한 조사가 완료될 때까지 “회원”의 계정제한 등 “서비스”의 이용을 정지할 수 있습니다.
① 계정이 해킹 또는 도용 당하였다는 정당한 신고가 접수된 경우
② 불법프로그램 사용자, 작업장 등 위법행위자로 합리적으로 의심되는 경우
③ 그 밖에 위 각 호에 준하는 사유로 계정의 잠정조치가 필요한 경우
2) 제1항의 경우 회사는 조사가 완료된 후 서비스 이용 기간에 비례하여 일정액을 지급하여 이용하는 “회원”에게 정지된 기간만큼 “회원”의 서비스 이용기간을 연장합니다. 다만, 제1항에 의한 위법행위자로 판명된 경우에는 그러하지 아니합니다.

제 14조 이용제한에 대한 이의신청 절차
1) “회원”이 “회사”의 이용제한에 불복하고자 할 때에는 통보를 받은 날로부터 15일 이내에 “회사”의 이용제한에 불복하는 이유를 기재한 이의신청서를 서면, 전자우편 또는 이에 준하는 방법으로 “회사”에 제출하여야 합니다.
2) 제1항의 이의신청서를 접수한 “회사”는 접수한 날로부터 15일 이내에 “회원”의 불복 이유에 대하여 서면, 전자우편 또는 이에 준하는 방법으로 답변하여야 합니다. 다만, “회사”는 15일 이내에 답변이 곤란한 경우 “회원”에게 그 사유와 처리일정을 통보합니다.
3) “회사”는 위 답변 내용에 따라 상응하는 조치를 취하여야 합니다.

제 15조 정보의 제공 및 광고의 게재
1) “회사”가 “회원”에게 “서비스”를 제공할 수 있는 서비스 투자 기반의 일부는 광고 게재를 통한 수익으로부터 나옵니다. “서비스”를 이용하고자 하는 “회원”는 서비스 이용 시 노출되는 광고 게재에 대해 동의하는 것으로 간주됩니다.
2) “회사”는 본 “서비스”에 게재되어 있거나 본 “서비스”를 통한 광고주의 판촉 활동에 “회원”이 참여하거나 교신 또는 거래의 결과로서 발생하는 모든 손실 또는 손해에 대해 책임을 지지 않습니다.
3) “회사”는 서비스 개선 및 이용자 대상 서비스 소개 등을 위한 목적으로 “회원” 개인에 대한 추가정보를 요구할 수 있으며, 동 요청에 대해 “회원”은 승낙하여 추가정보를 제공하거나 거부할 수 있습니다.
4)”회사”는 동의한 “회원”에 한하여 전자우편, SNS, 알림 메시지(Push Notification)등의 방법으로 광고성 정보를 전송할 수 있습니다. “회원”는 원하지 않는 경우에 언제든지 수신을 거부할 수 있으며, “회사”는 “회원”의 수신 거부 시 광고성 정보를 발송하지 아니합니다.

제 16조 정보의 수집
1) “회사”는 “서비스”의 운영 및 안정화, “서비스” 품질 개선을 위하여 단말기 정보, OS 정보 및 버전, 이용하고 있는 가입 통신사 정보, “회원”의 “서비스” 이용 내역 등을 수집할 수 있습니다.
2) “회사”는 채팅내용 등 “서비스” 내에서 이루어지는 통신내용을 저장 및 보관할 수 있습니다. “회사”는 “회원”간의 분쟁 조정, 민원 처리 또는 게임 질서의 유지를 위하여 “회사”가 필요하다고 판단하는 경우에 한하여 본 정보를 열람하도록 할 것이며, 본 정보는 “회사”만이 보유하고 법령으로 권한을 부여 받지 아니한 제3자는 절대로 열람할 수 없습니다. “회사”는 해당 정보를 열람하기 전에 채팅정보의 열람이 필요한 사유 및 열람 범위를 개인에게 사전 고지하기로 합니다. 다만, 계정도용, 현금거래, 언어폭력, 게임 내 사기 등 기망행위, 버그 악용, 기타 현행 법령 위반행위 및 이 약관 제9조(회원의 의무)에서 정하는 중대한 약관위반 행위의 조사, 처리, 확인 및 이의 구제와 관련하여 “회원”의 채팅 정보를 열람해야 할 필요가 있는 경우에는, 사후에 채팅정보가 열람된 개인들에 대하여 열람한 사유와 열람한 정보 중 본인과 관련된 부분을 고지하기로 합니다.

제 17조 저작권 등의 귀속
1) “회원”이 “서비스”를 이용하면서 게시한 저작물에 대한 권리와 책임은 “회원” 본인에게 있습니다.
2) “회사”가 작성한 저작물에 대한 저작권 기타 지적재산권은 “회사”에 귀속합니다.
3) “회원”은 “회사”가 제공하는 서비스를 이용함으로써 얻은 정보 중 “회사” 또는 정보를 제공한 업체에 지적 재산권이 귀속된 정보를 “회사” 또는 제공 업체의 사전승낙 없이 복제, 전송, 출판, 배포, 방송 기타 방법에 의하여 이용하거나 제3자에게 이용하게 하여서는 안 됩니다.
4) “회원”은 서비스 내에서 보여지거나 서비스와 관련하여 “회원” 또는 다른 “회원”이 게임 클라이언트 또는 서비스를 통해 업로드 또는 전송하는 대화 텍스트를 포함한 커뮤니케이션, 이미지, 사운드 및 모든 자료 및 정보(이하 "이용자 콘텐츠"라 함)에 대하여 “회사”가 다음과 같은 방법과 조건으로 이용하는 것을 허락합니다.
① 해당 "이용자 콘텐츠"를 이용, 편집 형식의 변경 및 기타 변형하는 것(공표, 복제, 공연, 전송, 배포, 방송, 2차적저작물 작성 등 어떠한 형태로든 이용 가능하며, 이용기간과 지역에는 제한이 없음)
② "이용자 콘텐츠"를 제작한 “회원”의 사전 동의 없이 거래를 목적으로 “이용자 콘텐츠”를 판매, 대여, 양도행위를 하여서는 안 됩니다.
5) “서비스” 내에서 보여지지 않고 “서비스”와 일체화되지 않은 “회원”의 "이용자 콘텐츠"(예컨대, 외부 커뮤니티 게시판에 등록된)에 대하여 “회사”는 “회원”의 명시적인 동의가 없이 상업적으로 이용하지 않으며, “회원”은 언제든지 이러한 "이용자 콘텐츠"를 삭제할 수 있습니다.
6) “회사”는 특정 게시물이 명예 훼손, 사생활 침해 등에 해당한다고 판단될 경우 그 게시자에게 사전 통지 없이 관련 게시물이나 자료에 대하여 '임시조치'를 취하며, 그 이후에는 당사자간 합의와 관련 법령 및 “회사”의 정책에 따라 이를 삭제 또는 복원할 수 있습니다.
7) “회사”가 운영하는 게시판 등에 게시된 정보로 인하여 법률상 이익이 침해된 “회원”은 “회사”에게 당해 정보의 삭제 또는 반박 내용의 게재를 요청할 수 있습니다. 이 경우 “회사”는 신속하게 필요한 조치를 취하고, 이를 신청인에게 통지합니다.
8) 본 조 제4항은 “회사”가 “서비스”를 운영하는 동안 유효하며 회원탈퇴 후에도 지속적으로 적용됩니다.

제 18조 유료 콘텐츠의 구매와 이용
1) 유료 콘텐츠의 가격 등은 서비스 내 상점 등에서 표시된 가격에 의하나, 외화 결제 시 환율 및 수수료 등으로 인하여 구매 시점의 예상 지불 금액과 실제 청구금액이 달라질 수 있습니다.
2) “회원”은 오픈 마켓 사업자 또는 결제 업체 등이 정하는 정책, 방법 등에 따라 결제금액을 납부해야 합니다.
3) 결제 한도는 “회사” 및 오픈 마켓 사업자, 결제 업체의 정책, 정부의 방침 등에 따라 조정될 수 있습니다.
4) “서비스” 내에서 “회원”이 구매한 유료 콘텐츠는 해당 게임 서비스 애플리케이션을 다운로드 받거나 설치한 단말기에서만 이용할 수 있습니다
5) “회원”이 구매한 유료 콘텐츠의 사용기간은 구매 시 명시된 사용기간을 따릅니다. 다만, 제11조 제4항에 따라 서비스 중지가 이루어지는 경우, 유료 콘텐츠의 사용기간은 서비스 중단 공지 시 공지된 “서비스”의 종료일까지로 봅니다. 사용기간이 경과한 후에는 이용자의 해당 유료 콘텐츠에 대한 사용권이 소멸됩니다. “회원”은 “회사”가 정하여 별도로 고지한 방법 이외에는 유료 콘텐츠를 “회원” 본인의 계정에서만 이용할 수 있으며, 타인에게 양도, 대여, 매매 기타 담보로 제공할 수 없습니다.
6) “회사”는 미성년자인 “회원”이 결제가 필요한 유료 콘텐츠를 이용하고자 하는 경우 부모 등 법정 대리인의 동의를 얻어야 하고, 동의 없이 이루어진 유료 콘텐츠 이용은 법정대리인이 취소할 수 있다는 내용을 유료 콘텐츠 이용을 위한 결제 전에 고지하도록 합니다.

제 19조 청약철회 및 효과
1) 유료 콘텐츠는 청약철회가 가능한 콘텐츠와 청약철회가 불가능한 콘텐츠로 구분되어 제공되며, 이러한 내용은 “회원”이 유료서비스를 구매할 시 고지합니다.
2) “회원”이 청약철회가 가능한 유료 콘텐츠를 구매한 경우, 구매일 또는 이용가능일로부터 7일 이내에 별도의 수수료 없이 청약철회(구매취소)의 신청을 할 수 있습니다.
3) “회원”은 구두 또는 서면(전자문서 포함), 전자우편 등으로 청약철회를 할 수 있습니다.
4) 청약철회가 가능한 유료 콘텐츠의 경우에도 구매 후 7일이 지났거나 사용한 경우, 재화 등의 가치가 현저히 감소한 경우, 기타 청약철회가 제한될 수 있는 사유가 발생한 경우에는 「전자 상거래등에서의 소비자 보호에 관한 법률」 제17조 제2항 제2호 내지 제3호 및 「콘텐츠산업진흥법」 제27조 제1항에 따라 청약철회(구매취소)가 제한될 수 있습니다. 이 경우 회사는 이용자에 대하여 해당 유료 콘텐츠 구매 시 고지하는 등 관련 법률에서 정한 바에 따른 조치를 취하기로 합니다.
5) 다음 각 호의 어느 하나에 해당하는 경우에는 제2항에 따른 청약철회가 제한됩니다.
① 구매 후 즉시 사용이 시작되거나 즉시 적용되는 아이템의 경우
② 서비스 이용 과정에서 획득한 아이템의 경우
③ 결제 시 지급되는 부가 상품(재화, 포인트, 마일리지, 아이템 등)의 일부를 사용한 경우
④ 묶음형으로 판매된 아이템의 일부가 사용된 경우
⑤ 개봉 행위(보관함으로 이동 등 포함)를 사용으로 볼 수 있거나 개봉 시 효용이 결정되는 아이템의 경우
⑥ “회사”가 “회원”에게 무료로 지급한 재화 및 아이템
⑦ 타인으로부터 선물 받은 유상 재화 및 유료 아이템
⑧ “회원”에게 책임이 있는 사유로 재화 등이 소실되거나 훼손된 경우
⑨ 그밖에 거래의 안전을 위하여 법령으로 정하는 경우
6) 유료 콘텐츠를 미성년자가 법정대리인의 동의 없이 구매한 경우, 미성년자 또는 법정대리인은 “회사”에게 청약철회를 요청할 수 있으며, “회사”는 법정대리인임을 증명할 수 있는 서류를 요구할 수 있습니다. 단, 미성년자의 구매가 법정대리인으로부터 처분을 허락 받은 재산의 범위 내인 경우 또는 미성년자가 사술 등을 사용하여 성인으로 믿게 한 때에는 취소가 제한됩니다. 구매자가 미성년자인지 여부는 구매가 진행된 단말기 또는 신용 카드 등 결제 수단의 명의자를 기준으로 판단됩니다.
7) "회원”이 청약 철회의 의사표시를 한 경우 "회사”는 지체 없이 "회원”의 유료아이템을 회수하고 오픈 마켓 사업자에게 청약 철회의 이행을 요청합니다. 대금의 결제와 동일한 방법으로 지급받은 대금을 환급하며, 동일한 방법으로 환불이 불가능할 때에는 이를 사전에 고지합니다. 단, 수납 확인이 필요한 결제 수단의 경우에는 수납 확인일을 기준으로 하여 환급합니다.
8) “회사”는 본 조의 절차에 따른 환급이 지연된 경우, “회사”가 "회원”에게 환급을 지연한 때에는 그 지연 기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 따른 지연 배상금을 환불금 지급 시 합산하여 지급합니다.
9) 단말기의 보호 책임은 “회원”에게 있으며, 이를 지인 또는 제3자가 이용하도록 하여서는 안됩니다. 단말기의 보호 부실, 제 3자에게 이용을 승낙함으로 발생하는 결제에 대해 청약철회 및 환불은 불가능합니다.
10) 콘텐츠 다운로드 및 서비스 이용 중에 발생한 요금/통화료는 환불 대상에서 제외됩니다.

제 20조 과오금의 환불
1) “회원”에게 과오금이 발생한 경우 환불이 이루어집니다. 결제과정에서 과오금이 발생하는 경우 원칙적으로는 “오픈마켓 사업자”에게 환불을 요청하여야 하나, “오픈마켓 사업자”의 정책, 시스템 상 환불 절차의 처리 지원이 가능한 경우, “회사”가 “오픈마켓 사업자”에게 필요한 환불절차의 이행을 요청할 수도 있습니다.
2) 환불은 “회원”이 결제한 방법과 동일한 방법으로 환불하는 것을 원칙으로 하되, 동일한 방법으로 환불이 불가능할 때에는 다른 방법으로 환불할 수 있습니다.
3) “회원”의 책임 있는 사유로 과오금이 발생한 경우, 환불에 소요되는 수수료 등은 “회원”이 부담합니다.
4) “회사”의 책임 있는 사유로 과오금이 발생한 경우 “회사”는 계약비용, 수수료 등에 관계 없이 과오금 전액을 환불해야 합니다.
5) 애플리케이션 다운로드 또는 네트워크 서비스를 이용하여 발생되는 요금(통화료, 데이터 통화료 등)은 환불 대상에서 제외될 수 있습니다.

제 21조 계약해지
1) “회원”이 이용 계약을 해지하고자 하는 때에는 “회원” 본인이 서비스 페이지상의 메뉴를 이용해 회원탈퇴 신청을 하거나, 고객센터를 통해 “회원” 탈퇴 신청을 할 수 있으며, 탈퇴 완료 시 “회원”의 이용 정보(점수, 캐릭터, 아이템, 게임머니 등)는 모두 삭제되어 복구가 불가능합니다. 단, “회사”는 “회원”의 회원가입 후 일정시간 동안 서비스 부정 이용 방지 등의 사유로 즉시 탈퇴를 제한할 수 있습니다.
2) “회사”는 “회원”이 현행법 위반및 고의 또는 중대한 과실로 “회사”에 손해를 입힌 경우에는 사전 통보 없이 이용계약을 해지할 수 있으며, 이 경우 “회원”은 유료 결제로 구매한 상품에 대해 사용 권한을 상실하고 이로 인한 환불 및 손해배상을 청구할 수 없습니다.
3) “회사”는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 및 동법 시행령에 따라 연속하여 1년 동안 서비스를 이용하지 않은 “회원”(이하 "휴면계정"이라함)의 개인 정보를 보호하기 위해 계약을 해지하고 개인정보 파기 및 분리 보관 등 필요한 조치를 취할 수 있습니다. 이 경우, 조치일 30일 전까지 필요한 조치가 취해진다는 사실과 개인정보 보유기간 만료일 및 개인정보의 항목을 “회원”에게 통지합니다.
4) “회원”이 이용 계약을 해지할 경우, 관계법 및 개인 정보 처리 방침에 따라 “회사”가 회원 정보를 보유하는 경우를 제외하고는 해지 즉시 “회원”의 계정 정보를 포함한 모든 데이터는 소멸됩니다.

제 22조 손해배상
1) “회원”이 본 약관의 의무를 위반함으로 인하여 “회사”에 손해를 입힌 경우 또는 “회원”이 서비스를 이용함에 있어 “회사”에 손해를 입힌 경우에 “회원”은 “회사”에 대하여 그 손해를 배상하여야 합니다.
2) “회원”이 서비스를 이용함에 있어 행한 불법 행위나 본 약관 위반 행위로 인하여 “회사”가 당해 “회원” 이외의 제3자로부터 손해배상 청구 또는 소송을 비롯한 각종 이의제기를 받는 경우, 당해 “회원”은 자신의 책임과 비용으로 “회사”를 면책시켜야 하며, “회사”가 면책되지 못한 경우 당해 “회원”은 그로 인하여 “회사”에 발생한 모든 손해를 배상할 책임이 있습니다.
3) “회사”는 “회사”가 무료로 제공하는 서비스와 관련하여 “회원”에게 발생한 손해에 대해서 어떠한 책임도 지지 않습니다. 다만, “회사”의 고의 또는 중대한 과실로 인하여 발생한 손해의 경우 “회사”가 손해에 대하여 배상할 책임이 있습니다.

제 23조 면책조항
1) "회사"는 통신망의 사용불가 및 장애, 천재지변 또는 국가 비상 사태, 정전 및 이에 준하는 불가항력 상황이 발생함으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.
2) "회사"는 "회원"의 귀책 사유로 인한 서비스 이용의 중지, 사용 제한, 데이터 삭제, 장애, 기간 통신 사업자가 전기 통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 “회원”에게 발생한 불이익에 대하여는 책임을 지지 않습니다.
3) "회사"는 "회사"의 고의 또는 중대한 과실이 없는 정보통신망 이용 환경으로 인하여 발생하는 문제 또는 "회원"의 모바일기기, PC 등의 각종 유무선 장치의 사용 환경으로 인하여 발생하는 제반 문제에 대해서는 책임을 지지 않습니다.
4) "회사"는 "회원"이 서비스와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.
5) “회사”는 “회원”이 서비스를 이용하여 기대하는 점수, 순위 등을 얻지 못한 것에 대하여 책임을 지지 않으며 서비스에 대한 취사 선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.
6) “회원”은 “모바일 기기” 비밀번호 설정 기능, “오픈마켓 사업자”가 제공하는 비밀번호 설정 기능 등을 이용하여 제3자의 “유료 결제”를 방지하여야 합니다. “회사”는 “회원”의 부주의로 인해 발생하는 제3자 결제에 대해 책임지지 않습니다.
7) "회사"는 "회원"간 또는 "회원"과 제3자 상호간에 서비스를 매개로 하여 거래 등을 한 경우에는 이에 관하여 책임을 지지 않습니다.
8) "회사"는 무료로 제공되는 서비스의 이용 및 변경, 중단과 관련하여 관련법에 특별한 규정 이 없는 한 책임을 지지 않습니다.
9) “회사”는 “회원”이 서비스를 이용하여 기대하는 이익을 얻지 못하거나 상실한 것에 대하여 책임을 지지 않습니다.
10) “회사”는 “회원”의 게임상 경험치, 등급, 아이템, 게임상 머니 등의 손실에 대하여 “회사”의 과실로 인한 경우를 제외하고는 책임을 지지 않습니다.
11) 기기 변경, 번호 변경, 해외 로밍, 통신사 이동 등의 경우 콘텐츠의 전부 또는 일부 기능을 이용할 수 없는 경우가 발생할 수 있으며, 이 경우 “회사”는 책임지지 않습니다.
12) “회사”에서 제공하는 콘텐츠를 삭제하는 경우, 이용 정보(점수, 캐릭터, 아이템, 게임머니 등)가 삭제되는 경우가 있을 수 있으므로 삭제에 신중을 기하여야 하며 “회사”는 이에 대해 책임을 지지 않습니다.
13) “회사”는 「청소년 보호법」, 「게임산업진흥에 관한 법률」 등 관련 법령, 정부 정책 및 본인 또는 법정 대리인의 선택 또는 이용자 보호 프로그램 정책에 따라 게임 서비스 또는 "회원"에 따라 게임서비스 이용 시간 등을 제한할 수 있으며, 이러한 제한 사항 및 제한에 따라 발생하는 게임서비스 이용 관련 제반 사항에 대해서는 책임이 면제됩니다.

제 24조 재판권 및 준거법
1) “회사”와 “회원”간 제기된 소송은 대한민국법을 준거법으로 합니다.
2) “회사”와 “회원”간 발생한 분쟁에 관한 재판 관할은 「민사소송법」 상의 관할 규정에 따릅니다.

제 25조 부칙
본 약관은 2020년 6월 10일부터 시행합니다.]]
local right_text = [[
개인정보취급방침 

㈜창유닷컴코리아(이하 “회사”라 함)는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 및 「개인정보보호법」 「통신비밀보호법」, 「전기통신사업법」 등 정보통신서비스제공자가 준수하여야 할 관련 법령상의 개인정보보호 규정을 준수하며, 관련 법령에 의거한 개인정보취급방침을 정하여 “회원” 권익 보호에 최선을 다하고 있습니다.

제 1조 수집하는 개인정보 항목 및 수집방법 
1) 수집하는 개인정보의 항목
“회사”는 서비스가입 시 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위하여 최초 서비스가입 시 다음과 같은 개인정보를 수집하고 있습니다. 수집되는 정보들은 서비스 이용 및 이벤트/마케팅에 참여하는 과정에서 자동으로 또는 “회원”이 정보를 직접 입력함으로써 수집됩니다.
① 회원가입 시 또는 게임 서비스 최초 이용 시
닉네임, 단말기 정보 (모델명, OS버전, 기기고유식별번호 등), 통신사 정보, 스토어정보, 게임버전, 이메일, 게임 및 서비스 이용기록, 접속기록, 쿠키, 결제기록, 유료 과금정보, 프로모션/이벤트 참여기록 및 상품 발송 관련 정보
② 창유계정 연동 시
이메일
③ 서비스 이용 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.
“회원”의 휴대폰 단말기 정보(모델명, OS 버전, 펌웨어 버전, 기기 고유번호 등), IP Address, 쿠키, 접속 로그, 서비스 이용 기록, 불량 이용 기록 등
④ 이벤트 프로모션에 참여하거나 선택형 서비스를 이용하는 경우 별도 동의 하에 아래의 정보를 수집할 수 있습니다.
이름, 휴대폰 번호, 주소, 이메일 주소, 생년월일, 성별, 거주 지역 등
⑤ 무료 / 유료 서비스 이용 과정에서 복구나 환불 등을 위해 불가피하게 필요한 경우
이메일 주소, 구매 내역 확인 내용, 타인 결제 사실 확인을 위한 실명 및 가족관계 증빙 서류
2) 개인정보 수집 방법
① “회사”의 최초 서비스 가입 시 동의 절차 제공을 통하여 수집
② “회사”와 서비스 제공관련 제휴관계에 있는 플랫폼을 통해 자동으로 수집
③ 이벤트 진행을 위하여 “회원”의 별도 동의 절차를 통해 수집
④ 1:1 상담 및 전화 상담을 통해 “회원”의 자발적 제공 혹은 필요에 의해 동의 하에 수집
3) “회원”은 위 개인정보의 수집 및 이용을 거부할 수 있으나 이 경우 서비스 일부 또는 전체의 이용이 어려울 수 있습니다.

제 2조 개인정보의 수집 및 이용목적
“회사”는 수집한 개인정보를 다음의 목적을 위해 활용하며, “회원”의 사전 동의 없이 수집한 개인정보를 함부로 공개하지 않습니다. 이용 목적 변경 시, 개인정보보호법 제 18조에 따라 공지 후 별도의 동의를 받는 등의 필요 절차를 이행합니다.
1) 고지 사항 전달, 불만 처리 등을 위한 원활한 의사 소통 경로의 확보
2) 유료정보 이용에 대한 문의 처리 및 계약 이행 분쟁 처리, 결제 환불 등 고객 서비스 제공
3) 게임 내 플레이 및 커뮤니티 서비스 지원
4) 마케팅 및 광고 활용 목적
① 신규 서비스 이벤트 정보 안내
② 신작 출시 및 업데이트 등의 게임 서비스 소식
③ 회사의 자체 채널을 이용한 각종 프로모션 및 이벤트 정보 등의 안내
④ 서비스 품질 향상 및 통계 정보 처리
⑤ 경품 등의 배송에 대한 정확한 배송지 확보
5) 기타 컨텐츠 제공 및 인증 서비스(아이디, 비밀번호 찾기 등)
6) 법정대리인의 동의 및 본인확인

제 3조 개인정보의 보유 및 이용기간
“회사”는 “회원”의 개인정보를 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 
다만, 수집 목적 또는 제공 받은 목적이 달성된 경우에도 「상법」, 「전자상거래 등에서의 소비자보호에 관한 법률」 등 관계 법령의 규정에 의하여 보존할 필요성이 있는 경우 “회사”는 관계 법령에서 정한 일정한 기간 동안 회원정보를 보관하며, 그 외 다른 목적으로는 절대 사용하지 않습니다.
1) “회사” 내부 방침에 의한 정보보유 사유
① 부정이용기록 (보존 이유: 부정이용 방지, 보존 기간: 1년)
② 탈퇴 회원에 대한 개인 정보 (보존 이유: 약관 및 내부 정책에 따라 부정 이용의 방지, 보존 기간: 3개월)
③ 고객 상담 신청 기록, 고객 상담 내용 및 서면 양식(보존 이유: 이용자 분쟁 관련 상담 진행, 보존 기간: 3개월)
2) 관련법령에 의한 정보보유 사유
상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 “회사”는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 “회사”는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다. 
① 계약 또는 청약철회 등에 관한 기록 (보존 이유: 전자상거래 등에서의 소비자보호에 관한 법률, 보존 기간: 5년)
② 대금결제 및 재화 등의 공급에 관한 기록 (보존 이유: 전자상거래 등에서의 소비자보호에 관한 법률, 보존 기간: 5년)
③ 소비자의 불만 또는 분쟁처리에 관한 기록 (보존 이유: 전자상거래 등에서의 소비자보호에 관한 법률, 보존 기간: 3년)
④ 본인확인에 관한 기록 (보존 이유: 정보통신망이용촉진 및 정보보호 등에 관한 법률, 보존 기간: 6개월)
⑤ 로그인 등 접속 및 방문에 관한 기록 (보존 이유: 통신비밀보호법, 보존 기간: 3개월)
⑥ 세법이 규정하는 모든 거래에 관한 장부 및 증빙서류 (보존 이유: 국세기본법에 관한 법률, 보존 기간: 5년)

제 4조 개인정보 파기절차 및 방법
“회원”의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. “회사”의 개인정보 파기절차 및 방법은 다음과 같습니다.
1) 파기절차
① “회원”이 서비스 가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(제 3조 개인정보의 보유 및 이용기간 참조)일정 기간 저장된 후 파기됩니다.
② 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다.
2) 파기방법
① 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.
② 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.

제 5조 개인정보의 공유 및 제공 
1) “회사”는 “회원”들의 개인정보를 "제 3조 개인정보의 수집 및 이용목적"에서 고지한 범위 내에서 사용하며, “회원”의 사전 동의 없이는 해당 범위를 초과하여 이용하지 않으며, 원칙적으로 “회원”의 개인정보를 외부에 공개하지 않습니다. 다만, 아래의 경우에는 규정한 범위를 넘어 개인정보를 이용하거나 제 3자에게 제공할 수 있습니다.
① 이용자가 사전에 동의한 경우
② 서비스 제공에 따른 요금 정산을 위해 필요한 경우
③ 전기통신기본법, 전기통신사업법 등 관계 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
④ 통계 작성, 학술 연구 또는 시장 조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 가공하여 제공하는 경우
⑤ 금융실명거래 및 비밀보장에 관률, 신용정보의 이용 및 보호에 관한 법률, 전기통신기본법, 전기통신사업법, 지방세법, 소비자보호법, 한국은행법, 형사소송법 등 법률에 특별한 규정이 있는 경우

제 6조 개인정보의 취급 위탁
“회사”는 서비스 제공 및 이용자 편의 증진을 위하여 아래와 같이 개인정보를 취급 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다. 회사의 개인정보 위탁처리 기관 및 위탁업무 내용은 아래와 같습니다.
1) GameDex
- 위탁 목적: 게임서비스운영, 고객상담 지원, 고객상담 녹취 시스템 운영위탁
- 이용기간: 회원 탈퇴 또는 위탁 계약 종료 시까지
2) gaming.com
- 위탁 목적: 인증번호 발송을 위한 이메일 수집 및 인증 이메일 발송
- 이용기간: 위탁 계약 종료 시까지

제 7조 “회원” 및 법정대리인의 권리와 그 행사방법
“회사”는 “회원”의 개인정보의 열람, 제공, 정정 요청에 대해 적극적으로 필요한 조치를 하며, 만 14세 미만 아동의 법정대리인은 아동 개인정보의 열람, 제공, 정정을 요청할 수 있는 권리를 가집니다.
1) 본 행사 방법은 “회사” 혹은 서비스 제공 관련 제휴 관계에 있는 플랫폼을 통해 요청을 받거나 회사 홈페이지를 통해 직접 요청하는 경우 처리할 수 있습니다.
2) “회원” 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며, 회사의 개인정보의 처리에 동의하지 않는 경우 동의를 거부하거나 회원탈퇴를 요청할 수 있습니다.
3) “회원” 혹은 만 14세 미만 아동의 개인정보 조회, 수정을 위해서는 '개인정보 변경'을 선택하고, 가입 해지를 위해서는 회원 탈퇴 신청을 선택 후 본인 확인 절차를 거치면 탈퇴가 가능합니다. 혹은 개인정보보호 책임자에게 서면, 전화 또는 이메일로 연락하면 지체 없이 조치합니다.
4) “회원”이 개인정보 오류에 대한 정정을 요청한 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다.
5) 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리 결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 합니다.
6) “회사”는 “회원” 혹은 법정 대리인의 요청에 의해 해지 또는 삭제 된 개인정보는 “제 3조 개인정보 보유 및 이용기간”에 명시 된 바에 따라 처리하며, 그 외의 용도로 열람 또는 이용할 수 없도록 처리합니다.

제 8조 개인정보 자동 수집 장치의 설치/운영 및 거부에 관한 사항 
1) “회사”는 이용자에게 맞춤화된 서비스를 제공하기 위해 이용자의 정보를 저장하고 불러오는 '쿠키(Cookie)'를 사용합니다. 쿠키는 서비스를 운영하는데 이용되는 서버가 이용자의 디바이스에 보내는 아주 작은 텍스트 파일로 이용자의 디바이스에 저장됩니다. “회사”는 다음 목적에 의해 쿠키를 사용합니다.
① “회원”과 비회원의 접속 빈도나 방문 시간 등을 분석, 고객님의 취향과 관심 분야, 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 등을 파악하여 개인 맞춤 서비스를 제공
2) “회원”은 쿠키 설치에 대한 선택권을 가지고 있습니다. 디바이스의 설정에서 쿠키를 허용할 것인지 여부를 설정할 수 있으며, 삭제 역시 할 수 있습니다. 단, 쿠키의 사용을 허용하지 않는 경우 로그인이 필요한 서비스 이용에 어려움이 있을 수 있습니다.

제 9조 개인정보의 기술적/관리적 보호 대책
“회사”는 “회원”들의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적/관리적 대책을 강구하고 있습니다.
1) 기술적 대책
① “회사”는 “회원”의 개인정보 중 관련 법령에서 지정한 항목을 암호화하여 보관하고 있으며, 개인정보의 확인 및 변경은 본인의 요청을 통하여 본인인증 후에만 가능합니다.
② 개인정보가 포함되어 있는 중요한 데이터는 그 파일 및 송신 데이터를 암호화하거나 파일 잠금 기능을 사용하는 등의 보안 기능을 사용하여 보호하고 있습니다.
③ “회사”는 해킹이나 컴퓨터 바이러스 등에 의하여 이용자의 개인정보가 유출되거나 훼손 되는 것을 방지하기 위하여 항상 감시하고 있습니다. 또한 만약의 사태를 대비하여 개인정보를 주기적으로 백업하고 있으며 백신 프로그램을 정기적으로 관리하여 개인정보가 침해되는 것을 방지하고 있습니다.
④ “회사”는 개인정보를 처리할 수 있도록 체계적으로 구성된 데이터베이스 시스템에 필요한 조치를 다하고 있습니다.
2) 관리적 대책
① “회사”는 “회원”의 개인정보에 대한 접근 권한을 최소한의 인원으로 제한하고 있으며, 그 최소 인원에 해당하는 자는 다음과 같습니다.
- “회원”을 직접 상대로 하여 마케팅, 이벤트, 고객지원, 배송업무를 수행하는 자 (위탁, 협력 업체의 직원 포함)
- 개인정보보호 책임자를 포함한 개인정보보호업무를 담당하는 자
- 기타 업무상 개인정보 처리가 불가피한 자
② “회사”는 개인정보취급자와 수탁사를 대상으로 개인정보보호 의무 등에 관해 정기적인 교육을 실시하고 있습니다.
③ “회사”는 개인정보보호 업무를 전담하는 부서에서 개인정보처리지침을 수립하여 관리하고 있습니다. 또한 내부 규정 준수 여부를 정기적으로 확인하여 문제가 발견될 경우, 즉시 바로잡을 수 있도록 노력하고 있습니다.
④ 개인정보 관련 취급자의 업무인수인계는 보안이 유지된 상태에서 이뤄지고 있으며 입사 및 퇴사 후 개인정보 사고에 대한 책임을 명확하게 하고 있습니다.
⑤ “회사”는 “회원” 개인의 실수 혹은 인터넷의 본질적인 위험성으로 인하여 야기되는 개인정보유출에 대해 일체 책임을 지지 않습니다.
⑥ “회원”은 본인의 개인정보를 보호하기 위해서 자신의 플랫폼 계정과 비밀번호, 이메일 등을 관리하고 그에 대한 책임을 져야 합니다.
3) 물리적 대책
① “회사”는 개인정보를 보관하고 있는 개인정보시스템의 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.
② 개인정보가 포함되어 있는 서류, 보조저장매체 등은 잠금 장치가 있는 안전한 장소에 보관하고 있습니다.

제 10조 개인정보에 관한 상담 및 문의
1) “회사”는 정기적인 교육과 더불어 개인정보 침해 방지를 위한 내부 지침 및 시스템 개선의 노력을 지속하고 있으며, 개인정보를 보호/관리하고 개인정보와 관련한 불만을 처리하기 위해 아래와 같이 개인정보관리책임자와 담당자를 지정하고 있습니다.
① 개인정보 관리 책임자
- 이름: 정문법
- 소속: 게임사업실
- 이메일: changyouhelp@gmail.com
- 전화번호: 1566-9267
② 개인정보 관리 담당자
- 이름: 고지원
- 소속: 게임사업실
- 이메일: changyouhelp@gmail.com
- 전화번호: 1566-9267
2) 기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.
① 개인정보침해신고센터 (http://privacy.kisa.or.kr / 국번없이 118)
② 대검찰청 사이버범죄수사단 (http://www.spo.go.kr / 02-3480-3571)
③ 경찰청 사이버테러대응센터 (http://www.ctrc.go.kr / 국번없이 182)
④ 개인정보분쟁조정위원회 (http://kopico.go.kr / 국번없이 1833-6972)
 
제 11조 기타
1) “회사”가 “회원”에게 서비스 상 다른 “회사”의 웹사이트 혹은 자료에 대한 링크를 제공할 수 있으며, 외부 사이트에서 개인정보를 수집하는 행위에 대해서는 본 개인정보처리방침이 적용되지 않습니다. 해당 사이트 방문 시에는 해당 사이트의 개인정보처리 방침을 확인하시기 바랍니다.
2) “회원”은 개인정보를 보호 받을 권리를 가짐과 동시에 본인의 정보를 스스로 보호하고 타인의 정보를 침해하지 않을 책임을 지닙니다. 자신과 타인 모두의 개인정보를 유출하거나 훼손하지 않도록 유의해야 하며, 책임을 다 하지 않을 경우 보호받지 못할 경우가 생길 수 있습니다. 또한 타인의 정보를 훼손할 경우 관련 법령에 의해 처벌받을 수 있으며, 이 경우 “회사”는 책임지지 않습니다.
3) 잘못된 개인정보를 입력하여 발생하는 이용상의 불이익 또는 손해는 전적으로 “회원” 본인에게 있습니다.

제 12조 고지의 의무
본 개인정보처리방침은 관련 법령 및 지침의 변경이나 회사의 내부 방침 변경 등으로 인하여 수시로 변경될 수 있으며, 개인정보처리방침의 변경이 있을 경우 최소 7일 전부터 공식 커뮤니티, 고객센터 또는 게임 내 연결화면을 통해 공지합니다.

부칙
본 방침은 2020년 6월 10일부로 적용됩니다.]]

function GameProvisionMediator:initialize()
	super.initialize(self)
end

function GameProvisionMediator:dispose()
	self._viewClose = true

	if self._rightGou:isVisible() and self._leftGou:isVisible() then
		self:dispatch(Event:new(EVT_GAME_PROVISION_AGREE))
	end

	super.dispose(self)
end

function GameProvisionMediator:onRemove()
	super.onRemove(self)
end

function GameProvisionMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._leftAgreeBtn = bindWidget(self, "main.left.agreeBtn", OneLevelMainButton, {
		handler = {
			clickAudio = "Se_Click_Common_1",
			func = bind1(self.onLeftAgreeBtnClicked, self)
		}
	})
	self._rightAgreeBtn = bindWidget(self, "main.right.agreeBtn", OneLevelMainButton, {
		handler = {
			clickAudio = "Se_Click_Common_1",
			func = bind1(self.onRightAgreeBtnClicked, self)
		}
	})
end

function GameProvisionMediator:userInject()
end

function GameProvisionMediator:enterWithData()
	self:initWidget()
	self:setUi()
	self:resetAgreeBtn()
end

function GameProvisionMediator:initWidget()
	self._leftGou = self:getView():getChildByFullName("main.left.di.gou")
	self._rightGou = self:getView():getChildByFullName("main.right.di.gou")
	self._leftAgreeBtn1 = self:getView():getChildByFullName("main.left.agreeBtn")
	self._rightAgreeBtn1 = self:getView():getChildByFullName("main.right.agreeBtn")
	self._mainNode = self:getView():getChildByFullName("main")
end

function GameProvisionMediator:setUi()
	self._leftAgreeBtn:setButtonName(Strings:get("Game_Policy_Agree"), Strings:get("Game_Policy_Agree_En"))
	self._rightAgreeBtn:setButtonName(Strings:get("Game_Policy_Agree"), Strings:get("Game_Policy_Agree_En"))
	self:createTableView("left")
	self:createTableView("right")
end

function GameProvisionMediator:createTableView(type)
	local nodeView = self:getView():getChildByFullName("main.left.desView")

	if type == "right" then
		nodeView = self:getView():getChildByFullName("main.right.desView")
	end

	local mark_str = left_text

	if type == "right" then
		mark_str = right_text
	end

	self._cellwidth = nodeView:getContentSize().width
	local descScrollView = ccui.ScrollView:create()

	descScrollView:setTouchEnabled(true)
	descScrollView:setBounceEnabled(true)
	descScrollView:setDirection(ccui.ScrollViewDir.vertical)
	descScrollView:setContentSize(nodeView:getContentSize())
	descScrollView:setPosition(0, 0)
	descScrollView:setAnchorPoint(0, 0)
	descScrollView:setName(type)
	nodeView:addChild(descScrollView)

	local str = Strings:get(mark_str)
	local title1 = cc.Label:createWithTTF(str, CUSTOM_TTF_FONT_1, 14)

	title1:setDimensions(310, 0)

	local title1_height = title1:getContentSize().height

	title1:setAnchorPoint(0, 0)
	title1:addTo(descScrollView)

	local size = nodeView:getContentSize()
	size.height = title1:getContentSize().height

	if descScrollView:getContentSize().height < title1_height then
		descScrollView:setTouchEnabled(true)
	else
		size = descScrollView:getContentSize()

		descScrollView:setTouchEnabled(false)
	end

	descScrollView:setInnerContainerSize(size)

	local offy = size.height
end

function GameProvisionMediator:resetAgreeBtn()
	self._leftGou:setVisible(false)
	self._rightGou:setVisible(false)
	self._leftAgreeBtn1:setGray(true)
	self._rightAgreeBtn1:setGray(true)
end

function GameProvisionMediator:onCloseButtonClick()
	self:close()
end

function GameProvisionMediator:onLeftAgreeBtnClicked()
	local isVisible = self._leftGou:isVisible()

	self._leftGou:setVisible(not isVisible)
	self._leftAgreeBtn1:setGray(isVisible)

	local gameServerAgent = DmGame:getInstance()._injector:getInstance("GameServerAgent")
	local remoteTimestamp = gameServerAgent:remoteTimestamp()
	local date = os.date("*t", remoteTimestamp)
	local timeStr = Strings:get("Agreement_Time_Format", {
		Year = date.year,
		Month = date.month,
		Day = date.day
	})
	local str = not isVisible and Strings:get("Policy_Agree", {
		time = timeStr
	}) or Strings:get("Policy_Refuse", {
		time = timeStr
	})

	self:dispatch(ShowTipEvent({
		tip = str
	}))
	self:checkFinshAgree()
end

function GameProvisionMediator:onRightAgreeBtnClicked()
	local isVisible = self._rightGou:isVisible()

	self._rightGou:setVisible(not isVisible)
	self._rightAgreeBtn1:setGray(isVisible)

	local gameServerAgent = DmGame:getInstance()._injector:getInstance("GameServerAgent")
	local remoteTimestamp = gameServerAgent:remoteTimestamp()
	local date = os.date("*t", remoteTimestamp)
	local timeStr = Strings:get("Agreement_Time_Format", {
		Year = date.year,
		Month = date.month,
		Day = date.day
	})
	local str = not isVisible and Strings:get("Agreement_Agree", {
		time = timeStr
	}) or Strings:get("Agreement_Refuse", {
		time = timeStr
	})

	self:dispatch(ShowTipEvent({
		tip = str
	}))
	self:checkFinshAgree()
end

function GameProvisionMediator:checkFinshAgree()
	if self._rightGou:isVisible() and self._leftGou:isVisible() then
		self._loginSystem:saveGamePoliceAgreeSta(true)
		self:close()
	end
end
