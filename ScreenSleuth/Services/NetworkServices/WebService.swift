//
//  WebService.swift
//  ScreenSleuth
//
//  Created by Home on 3/3/2024.
//

import Foundation

final class WebService {
    
    static let shared = WebService()
   
    private func baseRequest<T: Codable>(forRequest requestManager: RequestManager, type: T.Type) async throws -> T {
        let data = try await baseRequestGetData(requestManager)
        return try baseRequestDecodeData(data, for: type)
    }
    
    private func baseRequestGetData(_ requestManager :RequestManager ) async throws -> Data {
        // TODO: - Enahnce logs
        guard NetworkMonitorService.shared.isConnected else {
            throw NetworkError.noConnection
        }
        guard let request = try? requestManager.asURLRequest() else {
            throw NetworkError.invalidURLString
        }
        guard let (data, response) = try? await URLSession.shared.data(for: request) else {
            throw NetworkError.badUrl
        }
        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200
        else {
            throw NetworkError.invalidResponse
        }
        return data
    }
    
    private func baseRequestDecodeData<T: Codable>(_ data: Data, for type: T.Type) throws -> T {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)
            //Log.d("\(result as Any)")
            return result
        } catch DecodingError.dataCorrupted(let context) {
            throw NetworkError.decodingError
        } catch DecodingError.keyNotFound(let key, let context) {
            throw NetworkError.decodingError
        } catch DecodingError.valueNotFound(let value, let context) {
            throw NetworkError.decodingError
        } catch DecodingError.typeMismatch(let type, let context) {
            throw NetworkError.decodingError
        } catch {
            throw NetworkError.decodingError
        }
    }
    
}
