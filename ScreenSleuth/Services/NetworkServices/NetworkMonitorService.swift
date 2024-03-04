//
//  NetworkMonitorService.swift
//  ScreenSleuth
//
//  Created by Home on 3/3/2024.
//

import Foundation
import Network

final class NetworkMonitorService {
    static let shared = NetworkMonitorService()
    
    enum ConnectionType {
        case ethernet
        case wifi
        case cellular
        case unknown
    }
    
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    private(set) var connectionType: ConnectionType = .unknown
    private(set) var isConnected: Bool = false
    
    init(monitor: NWPathMonitor = NWPathMonitor()) {
        self.monitor = monitor
    }
    
    
    func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status != .unsatisfied
            self?.setFunctionType(path)
        }
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
    
    private func setFunctionType(_ path: NWPath) {
        if path.usesInterfaceType(.wiredEthernet) {
            connectionType = .ethernet
        } else if path.usesInterfaceType(.wifi) {
            connectionType = .wifi
        } else if path.usesInterfaceType(.cellular) {
            connectionType = .cellular
        } else {
            connectionType = .unknown
        }
    }
}

