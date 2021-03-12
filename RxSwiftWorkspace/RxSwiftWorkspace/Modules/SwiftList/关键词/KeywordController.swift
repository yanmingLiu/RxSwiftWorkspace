//
//  keywordController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/4.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit

class KeywordController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        text.text = """

        访问权限从高到低：

        open > public > interal > fileprivate > private

        open ：
        可以被任何人使用，不限制module，包括override和继承。

        public ↑ ：
        修饰属性和方法，可以被任何人访问，在module内可以被override和继承，但其他module中不可以被override和继承。

        internal  ↑ ：
        默认访问级别，internal修饰符可写可不写

        fileprivate ↑ ：
        表示该类只能在当前Swift源文件中访问，且该类不能被继承。

        private ↑ ：
        表示该类只能在当前Swift源文件中访问，且该类不能被继承。不能override。

        """
    }
}
