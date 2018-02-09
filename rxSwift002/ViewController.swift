//
//  ViewController.swift
//  rxSwift002
//
//  Created by David on 2/8/18.
//  Copyright © 2018 Vision Runner. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button.rx.tap
            .scan(0) { (priorValue, _) in
                return priorValue + 1
            }
            .asDriver(onErrorJustReturn: 0)
            .map { currentCount in
                return "You have tapped that button \(currentCount) times."
            }
            .drive(self.label.rx.text)
            .disposed(by: disposeBag)
    }
}















