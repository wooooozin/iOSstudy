//
//  ViewController.swift
//  CovidDemo
//
//  Created by 효우 on 2023/02/27.
//

import UIKit
import Alamofire
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var totalCaseLabel: UILabel!
    @IBOutlet var newCaseLabel: UILabel!
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCovidOverView { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(result):
                self.configureStackView(koreaCovieOverView: result.korea)
                let covidOverViewList = self.makeCovidOverViewList(cityCovidOverview: result)
                self.configureChartView(covideOverviewList: covidOverViewList)
                
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
    
    
}

extension ViewController {
    func fetchCovidOverView(completionHandler: @escaping (Result<CityCovidOverview, Error>) -> Void
    ) {
        let url = "https://api.corona-19.kr/korea/country/new/"
        let param = ["serviceKey":"gK9GzRXtjFSY5ZmQlIaBqb3v4nCMLW7i6"]
        
        AF.request(url, method: .get, parameters: param).responseData(completionHandler: { response in
            switch response.result {
            case let .success(data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(CityCovidOverview.self, from: data)
                    completionHandler(.success(result))
                } catch {
                    completionHandler(.failure(error))
                }
            case let .failure(error):
                completionHandler(.failure(error))
            }
        })
    }
    
    func configureStackView(koreaCovieOverView: CityOverView) {
        self.totalCaseLabel.text = "\(koreaCovieOverView.totalCase)명"
        self.newCaseLabel.text = "\(koreaCovieOverView.newCase)명"
    }
    
    func makeCovidOverViewList(cityCovidOverview: CityCovidOverview) -> [CityOverView] {
        return [
            cityCovidOverview.seoul,
            cityCovidOverview.busan,
            cityCovidOverview.daegu,
            cityCovidOverview.incheon,
            cityCovidOverview.gwangju,
            cityCovidOverview.daejeon,
            cityCovidOverview.ulsan,
            cityCovidOverview.sejong,
            cityCovidOverview.gyeonggi,
            cityCovidOverview.gangwon,
            cityCovidOverview.chungbuk,
            cityCovidOverview.chungnam,
            cityCovidOverview.jeonbuk,
            cityCovidOverview.jeonnam,
            cityCovidOverview.gyeongbuk,
            cityCovidOverview.gyeongnam,
            cityCovidOverview.jeju
        ]
    }
    
    func configureChartView(covideOverviewList: [CityOverView]) {
        let entries = covideOverviewList.compactMap { [weak self] overview -> PieChartDataEntry? in
            guard let self = self else { return }
            return PieChartDataEntry(
                value: self.removeFormatString(string: overview.newCase),
                label: overview.countryName,
                data: overview
            )
        }
        let dataSet = PieChartDataSet(entries: entries, label: "코로나 발생 현황")
        self.pieChartView.data = PieChartData(dataSet: dataSet)
    }
    
    func removeFormatString(string: String) -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: string)?.doubleValue ?? 0
    }
}
