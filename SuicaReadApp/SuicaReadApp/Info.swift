//
//  Info.swift
//  SuicaReadApp
//
//  Created by Miki Arakawa on 2020/06/12.
//  Copyright © 2020 Miki Arakawa. All rights reserved.
//



import Foundation

class Info {
    //画像の名前
    let iconName: String
    //日付のテキスト
    let datetime: String
    //タイトルのテキスト
    let title: String
    //説明文のテキスト
    let description: String
    // インスタンス化
    init(iconName: String,datetime: String,title: String, description: String) {
        self.iconName = iconName
        self.datetime = datetime
        self.title = title
        self.description = description
    }
}

class Title {
    //画像の名前
    let iconName: String
    //日付のテキスト
    let datetime: String
    //タイトルのテキスト
    let title: String
    //説明文のテキスト
    let description: String
    // インスタンス化
    init(iconName: String, datetime: String,title: String, description: String) {
        self.iconName = iconName
        self.datetime = datetime
        self.title = title
        self.description = description
    }
}

