//
//  GetClinics.swift
//  CMD
//
//  Created by A Avinash Chidambaram on 25/06/25.
//

import Foundation

func retrieveClinics() async throws -> [Clinic] {
    guard let url = URL(string: "http://localhost:3000/api/clinics") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    let (data, response) = try await URLSession.shared.data(for: request)

    guard let httpResponse = response as? HTTPURLResponse,
          (200...299).contains(httpResponse.statusCode) else {
        throw URLError(.badServerResponse)
    }

    let decoder = JSONDecoder()
    let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds] // ✅ fractional seconds
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            guard let date = isoFormatter.date(from: dateStr) else {
                throw DecodingError.dataCorruptedError(in: container,
                    debugDescription: "Invalid ISO8601 date: \(dateStr)")
            }
            return date
        }

    let clinics = try decoder.decode([Clinic].self, from: data)
    
    return clinics
}
