// SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
// Copyright (C) 2025-2026 Bain Gurley

//
//  RuntimeCapabilities.swift
//  Rivulet
//
//  What this install can actually use. A copy re-signed by a sideloading tool on a free
//  Apple account keeps the code but loses capabilities its profile cannot carry, such as
//  the App Group the Apple-hosted asset pack needs. Features that depend on one check
//  here instead of assuming it, so such an install degrades instead of crashing.
//  (iCloud has its own check, `SyncCatalog.cloudAvailable`.)
//
//  App Store, TestFlight and Simulator builds report everything available.
//

import Foundation

nonisolated enum RuntimeCapabilities {
    /// The App Group shared with the Top Shelf and asset-pack extensions.
    private static let appGroupIdentifier = "group.com.bain.Rivulet"

    /// The App Group container is reachable. The Apple-hosted asset pack needs it, and
    /// `AssetPackManager` must not be used without it.
    static let hasAssetPacks: Bool = {
        FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupIdentifier) != nil
    }()
}
