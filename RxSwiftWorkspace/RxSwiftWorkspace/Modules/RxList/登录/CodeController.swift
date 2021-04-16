//
//  CodeController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/7.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit

class CodeController: BaseViewController {

    public var phone = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }


    private func setupUI() {

        view.backgroundColor = .white
        text.removeFromSuperview()

        let titleLabel = UILabel().then {
            $0.text = "短信确认"
            $0.font = .boldSystemFont(ofSize: 27)
            $0.textColor = .hexString("#363636")
        }
        view.addSubview(titleLabel)

        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.top.equalToSuperview().offset(88)
        }

        let phoneLabel = UILabel().then {
            $0.text = "请输入 " + phone[0..<3] + "******" + phone[9..<12] + " 收到的验证码"
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = .hexString("#484848")
        }
        view.addSubview(phoneLabel)

        phoneLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(10)
        }

        let code = CodeView().then {
            $0.Base.changeInputNum(num: 4)
            $0.Base.lineColor = .hexString("#E5E5E5")
            $0.Base.fontNum = .boldSystemFont(ofSize: 34)
            $0.Base.lineInputColor = .hexString("#22BB62")
            $0.Base.cursorColor = .hexString("#22BB62")
        }
        view.addSubview(code)

        code.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(64)
            make.top.equalTo(phoneLabel.snp_bottomMargin).offset(30)
        }


        //To obtain Input Text
        code.callBacktext = { str in
            if str == "1234" {

            } else {
                code.clearnText(error: "error")
            }
        }
        
        view.adaptSubViews()
    }
}
