//
//  CityCovidOverView.swift
//  CovidDemo
//
//  Created by 효우 on 2023/02/28.
//

import Foundation

struct CityCovidOverview: Codable {
    let resultCode, resultMessage: String
    let korea, seoul, busan, daegu: CityOverView
    let incheon, gwangju, daejeon, ulsan: CityOverView
    let sejong, gyeonggi, gangwon, chungbuk: CityOverView
    let chungnam, jeonbuk, jeonnam, gyeongbuk: CityOverView
    let gyeongnam, jeju, quarantine: CityOverView
}

struct CityOverView: Codable {
    let countryName, newCase, totalCase, recovered: String
    let death, percentage, newCcase, newFcase: String
}
