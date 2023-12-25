//
//  ApiRouter.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 16/12/23.
//

import Foundation

enum ApiRouter: RequestInfoConvertible {
    case hotel
    case rooms
    case reservation
    
    var api: String {
        "https://run.mocky.io/v3"
    }
    
    var urlString: String {
        "\(api)/\(endPoint)"
    }
    
    var endPoint: String {
        switch self {
        case .hotel:
            return "d144777c-a67f-4e35-867a-cacc3b827473"
        case .rooms:
            return "8b532701-709e-4194-a41c-1a903af00195"
        case .reservation:
            return "63866c74-d593-432c-af8e-f279d1a8d2ff"
        }
    }
    
    func asRequestInfo() -> RequestInfo {
        let requestInfo: RequestInfo = RequestInfo(url: urlString)
        return requestInfo
    }
}
