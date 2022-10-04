// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Assets {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal enum Avatars {
    internal static let avatarFemale1 = ImageAsset(name: "avatar_female_1")
    internal static let avatarFemale2 = ImageAsset(name: "avatar_female_2")
    internal static let avatarMale1 = ImageAsset(name: "avatar_male_1")
    internal static let avatarMale2 = ImageAsset(name: "avatar_male_2")
    internal static let avatarMale3 = ImageAsset(name: "avatar_male_3")
    internal static let avatarMale4 = ImageAsset(name: "avatar_male_4")
  }
  internal enum Background {
    internal static let patternBottom = ImageAsset(name: "pattern_bottom")
    internal static let patternLeft = ImageAsset(name: "pattern_left")
    internal static let patternRight = ImageAsset(name: "pattern_right")
    internal static let patternTop = ImageAsset(name: "pattern_top")
  }
  internal enum GameScreen {
    internal static let gameCanvas = ImageAsset(name: "gameCanvas")
  }
  internal enum HomeScreen {
    internal static let greetings = ImageAsset(name: "greetings")
    internal static let shevchenkoWithRpg = ImageAsset(name: "shevchenko_with_rpg")
  }
  internal enum Icons {
    internal static let crossCircleFill = ImageAsset(name: "cross_circle_fill")
    internal static let leftArrowCircleFill = ImageAsset(name: "left_arrow_circle_fill")
    internal static let plusCircleFill = ImageAsset(name: "plus_circle_fill")
    internal static let subtract = ImageAsset(name: "subtract")
  }
  internal enum LaunchScreen {
    internal static let heartUaFlag = ImageAsset(name: "heart_ua_flag")
  }
  internal enum PlayersScreen {
    internal static let traktor = ImageAsset(name: "traktor")
    internal static let woodSign = ImageAsset(name: "wood_sign")
  }
  internal static let redColor = ColorAsset(name: "RedColor")
  internal enum Stickers {
    internal static let sticker1 = ImageAsset(name: "Sticker_1")
    internal enum Gameukrainestickers {
      internal static let file111042826 = ImageAsset(name: "file_111042826")
      internal static let file111042828 = ImageAsset(name: "file_111042828")
      internal static let file111042829 = ImageAsset(name: "file_111042829")
      internal static let file111042830 = ImageAsset(name: "file_111042830")
      internal static let file111042831 = ImageAsset(name: "file_111042831")
      internal static let file111042835 = ImageAsset(name: "file_111042835")
      internal static let file111042836 = ImageAsset(name: "file_111042836")
      internal static let file111042838 = ImageAsset(name: "file_111042838")
      internal static let file111042847 = ImageAsset(name: "file_111042847")
      internal static let file111042849 = ImageAsset(name: "file_111042849")
      internal static let file111042851 = ImageAsset(name: "file_111042851")
      internal static let file111042853 = ImageAsset(name: "file_111042853")
      internal static let file111042854 = ImageAsset(name: "file_111042854")
      internal static let file111042855 = ImageAsset(name: "file_111042855")
      internal static let file111042857 = ImageAsset(name: "file_111042857")
      internal static let file111042866 = ImageAsset(name: "file_111042866")
      internal static let file111042867 = ImageAsset(name: "file_111042867")
      internal static let file111042869 = ImageAsset(name: "file_111042869")
      internal static let file111042871 = ImageAsset(name: "file_111042871")
      internal static let file111042873 = ImageAsset(name: "file_111042873")
      internal static let file111042881 = ImageAsset(name: "file_111042881")
      internal static let file111042883 = ImageAsset(name: "file_111042883")
      internal static let promo = ImageAsset(name: "promo")
    }
    internal enum Rusniahuinia {
      internal static let file111036670 = ImageAsset(name: "file_111036670")
      internal static let file111036673 = ImageAsset(name: "file_111036673")
      internal static let file111036675 = ImageAsset(name: "file_111036675")
      internal static let file111036680 = ImageAsset(name: "file_111036680")
      internal static let file111036683 = ImageAsset(name: "file_111036683")
      internal static let file111036686 = ImageAsset(name: "file_111036686")
      internal static let file111036691 = ImageAsset(name: "file_111036691")
      internal static let file111036695 = ImageAsset(name: "file_111036695")
      internal static let file111036703 = ImageAsset(name: "file_111036703")
      internal static let file111036709 = ImageAsset(name: "file_111036709")
      internal static let file111036714 = ImageAsset(name: "file_111036714")
      internal static let file111036723 = ImageAsset(name: "file_111036723")
      internal static let file111036734 = ImageAsset(name: "file_111036734")
      internal static let file111036751 = ImageAsset(name: "file_111036751")
      internal static let file111036760 = ImageAsset(name: "file_111036760")
      internal static let file111036767 = ImageAsset(name: "file_111036767")
      internal static let promo = ImageAsset(name: "promo")
    }
    internal enum Russiasuckk {
      internal static let file111036333 = ImageAsset(name: "file_111036333")
      internal static let file111036336 = ImageAsset(name: "file_111036336")
      internal static let file111036341 = ImageAsset(name: "file_111036341")
      internal static let file111036343 = ImageAsset(name: "file_111036343")
      internal static let file111036346 = ImageAsset(name: "file_111036346")
      internal static let file111036348 = ImageAsset(name: "file_111036348")
      internal static let file111036351 = ImageAsset(name: "file_111036351")
      internal static let file111036353 = ImageAsset(name: "file_111036353")
      internal static let file111036356 = ImageAsset(name: "file_111036356")
      internal static let file111036357 = ImageAsset(name: "file_111036357")
      internal static let file111036360 = ImageAsset(name: "file_111036360")
      internal static let file111036363 = ImageAsset(name: "file_111036363")
      internal static let file111036365 = ImageAsset(name: "file_111036365")
      internal static let file111036369 = ImageAsset(name: "file_111036369")
      internal static let file111036371 = ImageAsset(name: "file_111036371")
      internal static let file111036373 = ImageAsset(name: "file_111036373")
      internal static let file111036375 = ImageAsset(name: "file_111036375")
      internal static let file111036378 = ImageAsset(name: "file_111036378")
      internal static let file111036381 = ImageAsset(name: "file_111036381")
      internal static let file111036382 = ImageAsset(name: "file_111036382")
      internal static let promo = ImageAsset(name: "promo")
    }
    internal static let sticker10 = ImageAsset(name: "sticker_10")
    internal static let sticker11 = ImageAsset(name: "sticker_11")
    internal static let sticker12 = ImageAsset(name: "sticker_12")
    internal static let sticker2 = ImageAsset(name: "sticker_2")
    internal static let sticker3 = ImageAsset(name: "sticker_3")
    internal static let sticker4 = ImageAsset(name: "sticker_4")
    internal static let sticker5 = ImageAsset(name: "sticker_5")
    internal static let sticker6 = ImageAsset(name: "sticker_6")
    internal static let sticker7 = ImageAsset(name: "sticker_7")
    internal static let sticker8 = ImageAsset(name: "sticker_8")
    internal static let sticker9 = ImageAsset(name: "sticker_9")
    internal enum Ukrainegame {
      internal static let promo = ImageAsset(name: "Promo")
      internal static let file111043260 = ImageAsset(name: "file_111043260")
      internal static let file111043262 = ImageAsset(name: "file_111043262")
      internal static let file111043263 = ImageAsset(name: "file_111043263")
      internal static let file111043264 = ImageAsset(name: "file_111043264")
      internal static let file111043266 = ImageAsset(name: "file_111043266")
      internal static let file111043267 = ImageAsset(name: "file_111043267")
      internal static let file111043268 = ImageAsset(name: "file_111043268")
      internal static let file111043269 = ImageAsset(name: "file_111043269")
      internal static let file111043270 = ImageAsset(name: "file_111043270")
      internal static let file111043272 = ImageAsset(name: "file_111043272")
    }
  }
  internal static let whiteColor = ColorAsset(name: "WhiteColor")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
