//
//  OpenCloseSensorConfig.swift
//  Pods
//
//  Created by Jerome Schmitz on 01.05.16.
//
//

import Foundation
import Gloss

public class OpenCloseSensorConfig: PartialSensorConfig {

    init(sensorConfig: SensorConfig) {
        
        super.init(on: sensorConfig.on, reachable: sensorConfig.reachable, battery: sensorConfig.battery, url: sensorConfig.url)
    }
    
    required public init?(json: JSON) {
        super.init(json: json)
    }
}

public func ==(lhs: OpenCloseSensorConfig, rhs: OpenCloseSensorConfig) -> Bool {
    return lhs.on == rhs.on &&
        lhs.reachable == rhs.reachable &&
        lhs.battery == rhs.battery &&
        lhs.url == rhs.url
}