//
//  TitleTagViewController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2021/3/15.
//  Copyright © 2021 lym. All rights reserved.
//

import SwiftyAttributes
import UIKit

class TitleTagViewController: UIViewController {
    var label1: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        demo1()

        demo2()
    }

    func demo2() {
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .random
        titleLabel.numberOfLines = 2
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 40).isActive = true

        // 标签图片
        let imgv = UIImageView(image: UIImage(named: "iconVideoSelected"))
        view.addSubview(imgv)
        imgv.translatesAutoresizingMaskIntoConstraints = false
        imgv.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        imgv.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true

        // tittle
        let font = UIFont.boldSystemFont(ofSize: 18)
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 4
        paragraph.lineBreakMode = .byTruncatingTail
        paragraph.firstLineHeadIndent = font.lineHeight + 4
        let attributes: [NSAttributedString.Key: Any] = [.font: font,
                                                         .foregroundColor: UIColor.black,
                                                         .paragraphStyle: paragraph]
        let title = "132413412341234123412341234123412341233412341234123412341234123423412341234123412341234"
        let attrText = NSAttributedString(string: title, attributes: attributes)
        titleLabel.attributedText = attrText

        let label1 = UILabel()
        label1.textColor = .gray
        label1.numberOfLines = 0
        label1.text = "2.遇到这种情况就要利用富文本的首行缩进功能，让首行空出图片的位子，图片的宽高 = titleFont.lineHeight"

        view.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        label1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        label1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
    }

    func demo1() {
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .random
        titleLabel.numberOfLines = 2
        view.addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true

        let font = UIFont.boldSystemFont(ofSize: 18)
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "iconVideoSelected")
        attachment.bounds = CGRect(x: 0, y: -4, width: font.lineHeight, height: font.lineHeight)
        let attributedText = NSMutableAttributedString(attachment: attachment)

        let title = "132413412341234123412341234123412341233412341234123412341234123423412341234123412341234"
            .withAttributes([.font(font),
                             .textColor(.black)])
        attributedText.append(title)
        titleLabel.attributedText = attributedText

        let label1 = UILabel()
        label1.textColor = .gray
        label1.numberOfLines = 0
        label1.text = "1. 标签在前，如果给富文本添加attachment，那如果后面的文字是连着的当字符（譬如98798798...）就会出现attachment和文字换行的问题，字符会另起一行。"
        view.addSubview(label1)

        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        label1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        label1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true

        self.label1 = label1
    }
}
