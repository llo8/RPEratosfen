//
//  EratosfenInteractor.swift
//  RPEratosfen
//
//  Created by Юрий on 27.05.17.
//  Copyright (c) 2017 Юрий. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import Foundation

protocol EratosfenInteractorInput {
    func eratosfen(number: UInt)
}

protocol EratosfenInteractorOutput {
    func presentSumPrimes(primes: [UInt])
    func presentPrimes(primes: [UInt])
}

protocol EratosfenDataSource {
    
}

protocol EratosfenDataDestination {
    
}

class EratosfenInteractor: EratosfenInteractorInput, EratosfenDataSource, EratosfenDataDestination {

    var output: EratosfenInteractorOutput?
    
    // MARK: Business logic
    
    internal func eratosfen(number: UInt) {
        DispatchQueue.global(qos: .utility).async {
            EratosfenWorker().eratosfenWheelFactorization(number: number,
                                                          completionHandler: {(primes: [UInt]) -> Void in
                DispatchQueue.main.async {
                    self.output?.presentPrimes(primes: primes)
                    self.output?.presentSumPrimes(primes: primes)
                }
            })
        }
    }
}
