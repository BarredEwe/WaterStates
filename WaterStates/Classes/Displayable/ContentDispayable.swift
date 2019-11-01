public protocol ContentDispayable {
    associatedtype ContentType
    func showContent(_: ContentType)
    func hideContent()
}
