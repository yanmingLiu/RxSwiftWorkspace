//
//  LoginController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/7.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit
import TextFieldEffects
import SwiftyAttributes

class LoginController: BaseViewController {

    var sendBtn : UIButton!
    var inputTF : HoshiTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        bindUI()

    }

    private func bindUI() {

        inputTF.rx.text.orEmpty
            .map({$0[0..<11]})
            .bind(to: inputTF.rx.text)
            .disposed(by: rx.disposeBag)

    }

    private func setupUI() {
        view.backgroundColor = UIColor.white
        text.removeFromSuperview()

        let titleLable = UILabel().then {
            $0.textAlignment = .left
            $0.textColor = .hexString("#363636")
            $0.text = "手机快捷登录"
            $0.font = .boldSystemFont(ofSize: 27)
        }
        view.addSubview(titleLable)

        titleLable.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.top.equalToSuperview().offset(navigationController?.navigationBar.bounds.size.height ?? 64 + 10)
            make.height.equalTo(38)
        }

        let subTitleLabel = UILabel().then {
            $0.text = "输入手机号进行登录/注册"
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = .hexString("#484848")
            $0.textAlignment = .left
        }
        view.addSubview(subTitleLabel)

        subTitleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.top.equalTo(titleLable.snp_bottomMargin).offset(15)
            make.height.equalTo(22)
        }

        let textField = HoshiTextField().then {
            $0.textAlignment = .left
            $0.placeholderColor = .hexString("#A9A9A9")
            $0.font = .systemFont(ofSize: 18, weight: .bold)
            $0.textColor = .hexString("#484848")
            $0.borderInactiveColor = .hexString("#A9A9A9")
            $0.borderActiveColor = .hexString("#22BB62")
            $0.tintColor = .hexString("#484848")
            $0.placeholder = "手机号"
            $0.placeholderFontScale = 0.7
            $0.keyboardType = .phonePad
            $0.clearButtonMode = .whileEditing
        }
        view.addSubview(textField)
        inputTF = textField

        textField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.top.equalTo(subTitleLabel.snp_bottomMargin).offset(30)
            make.height.equalTo(64)
        }

        let btn = UIButton().then {
            $0.setTitle("发送短信验证码", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 17)
            $0.backgroundColor = .hexString("#22BB62")
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 4;
        }
        view.addSubview(btn)
        sendBtn = btn;

        btn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.top.equalTo(textField.snp_bottomMargin).offset(30)
            make.height.equalTo(54)
        }

        btn.rx.tap.subscribe(onNext: { [weak self]  in
            dlog("btn 点击")

            let vc = CodeController()
            vc.phone = textField.text ?? ""
            self?.navigationController?.pushViewController(vc, animated: true)

        }).disposed(by: rx.disposeBag)


        let webLabel = UILabel().then {
            $0.textAlignment = .center
            $0.isUserInteractionEnabled = true

            let attStr1 = "点击按钮即为同意".withAttributes([
                .font(.systemFont(ofSize: 14)),
                .textColor(.hexString("#A9A9A9")),
                ])

            let attStr2 = "《产业工人用户使用协议》".withAttributes([
                .font(.systemFont(ofSize: 14)),
                .textColor(.hexString("#22BB62"))
                ])

            $0.attributedText = attStr1 + attStr2

            let tap = UITapGestureRecognizer()
            $0.addGestureRecognizer(tap)
            tap.rx.event.asObservable().subscribe(onNext: { (recognizer) in
                dlog("tap 点击")

            }).disposed(by: rx.disposeBag)
        }
        view.addSubview(webLabel)

        webLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(btn.snp_bottomMargin).offset(126)
        }

        view.adaptSubViews()
    }

}
