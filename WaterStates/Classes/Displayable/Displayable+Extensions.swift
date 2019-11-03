public extension LoadingDisplayable {
    func showLoading(_: String) {}
    func hideLoading() {}
}

public extension ContentDispayable {
    func showContent(_: ContentType) {}
    func hideContent() {}
}

public extension EmptyDisplayable {
    func showEmpty(_ message: String?) { }
    func hideEmpty() {}
}

public extension ErrorDispayable {
    func showError(_ error: Error?) { }
    func hideError() {}
}
