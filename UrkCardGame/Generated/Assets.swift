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
  internal enum Colors {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal static let negativeColor = ColorAsset(name: "NegativeColor")
    internal static let secondaryColor = ColorAsset(name: "SecondaryColor")
    internal static let textColor = ColorAsset(name: "TextColor")
    internal static let yellowColor = ColorAsset(name: "YellowColor")
  }
  internal enum GameScreen {
    internal static let gameCanvas = ImageAsset(name: "gameCanvas")
  }
  internal enum HomeScreen {
    internal static let greetings = ImageAsset(name: "greetings")
    internal static let shevchenkoWithRpg = ImageAsset(name: "shevchenko_with_rpg")
  }
  internal enum Icons {
    internal static let subtract = ImageAsset(name: "Subtract")
    internal static let crossCircleFill = ImageAsset(name: "cross_circle_fill")
    internal static let leftArrowCircleFill = ImageAsset(name: "left_arrow_circle_fill")
    internal static let plusCircleFill = ImageAsset(name: "plus_circle_fill")
  }
  internal enum LaunchScreen {
    internal static let heartUaFlag = ImageAsset(name: "heart_ua_flag")
    internal static let launchScreenText = ImageAsset(name: "launch_screen_text")
  }
  internal enum PlayersScreen {
    internal static let traktor = ImageAsset(name: "traktor")
    internal static let uaFlagSign = ImageAsset(name: "ua_flag_sign")
  }
  internal enum Stickers {
    internal static let sticker1 = ImageAsset(name: "Sticker_1")
    internal enum Firstpackukrainegame {
      internal static let file111068017 = ImageAsset(name: "file_111068017")
      internal static let file111068018 = ImageAsset(name: "file_111068018")
      internal static let file111068020 = ImageAsset(name: "file_111068020")
      internal static let file111068024 = ImageAsset(name: "file_111068024")
      internal static let file111068033 = ImageAsset(name: "file_111068033")
      internal static let file111068034 = ImageAsset(name: "file_111068034")
      internal static let file111068035 = ImageAsset(name: "file_111068035")
      internal static let file111068038 = ImageAsset(name: "file_111068038")
      internal static let firstpackCover = ImageAsset(name: "firstpackCover")
    }
    internal static let pesuk = ImageAsset(name: "pesuk")
    internal static let slavaZsu = ImageAsset(name: "slava_zsu")
    internal enum Slavaukraineappgame {
      internal static let file111036333 = ImageAsset(name: "file_111036333")
      internal static let file111036336 = ImageAsset(name: "file_111036336")
      internal static let file111036341 = ImageAsset(name: "file_111036341")
      internal static let file111036343 = ImageAsset(name: "file_111036343")
      internal static let file111036357 = ImageAsset(name: "file_111036357")
      internal static let file111036363 = ImageAsset(name: "file_111036363")
      internal static let file111036365 = ImageAsset(name: "file_111036365")
      internal static let file111036378 = ImageAsset(name: "file_111036378")
      internal static let file111036382 = ImageAsset(name: "file_111036382")
      internal static let slavaukrainecover = ImageAsset(name: "slavaukrainecover")
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
    internal static let vseBudeDobre = ImageAsset(name: "vse_bude_dobre")
  }
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
