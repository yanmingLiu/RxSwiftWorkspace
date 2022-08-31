//
//  IconFontCode.swift
//  OCIconFontDemo
//
//  Created by lym on 2022/8/31.
//

import Foundation

/// IconFont字体对应Unicode-Int类型的
@objc public enum IconCode: UInt32 {
    case buhangIcon = 0xe624
    case dingweijiudianIcon = 0xe620
    case gongjiaoIcon = 0xe621
    case guanbiIcon = 0xe615
    case jiacheIcon = 0xe625
    case jianshaoIcon = 0xE616
    case jingshixinxiIcon = 0xE618
    case lianxijiudianIcon = 0xE622
    case qiehuanIcon = 0xE623
    case sousuoIcon = 0xE61F
    case tongxunluIcon = 0xE619
    case xiangshangshouqiIcon = 0xE62B
    case xiangxiazhankaihuoxiangshangshouqiIcon = 0xE61E
    case xinxiIcon = 0xe61A
    case youjiantouIcon = 0xE617
    case yuedufuHuodeIcon = 0xE61C
    case zengjiaIcon = 0xE61D
    case zuojiantouIcon = 0xE61B
}

/// IconFont字体对应Unicode-String类型的
public enum IconCodeStr: String {
    case buhangIcon = "\u{E624}"
    case dingweijiudianIcon = "\u{E620}"
    case gongjiaoIcon = "\u{E621}"
    case guanbiIcon = "\u{E615}"
    case jiacheIcon = "\u{E625}"
    case jianshaoIcon = "\u{E616}"
    case jingshixinxiIcon = "\u{E618}"
    case lianxijiudianIcon = "\u{E622}"
    case qiehuanIcon = "\u{E623}"
    case sousuoIcon = "\u{E61F}"
    case tongxunluIcon = "\u{E619}"
    case xiangshangshouqiIcon = "\u{E62B}"
    case xiangxiazhankaihuoxiangshangshouqiIcon = "\u{E61E}"
    case xinxiIcon = "\u{E61A}"
    case youjiantouIcon = "\u{E617}"
    case yuedufuHuodeIcon = "\u{E61C}"
    case zengjiaIcon = "\u{E61D}"
    case zuojiantouIcon = "\u{E61B}"
}

