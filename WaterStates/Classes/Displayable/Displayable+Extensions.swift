public extension LoadingDisplayable {
    func showLoading(_: StateInfo) {}
    func hideLoading() {}
}

public extension ContentDispayable {
    func showContent(_: ContentType) {}
    func hideContent() {}
}

public extension EmptyDisplayable {
    func showEmpty(_: StateInfo) {}
    func hideEmpty() {}
}

public extension ErrorDispayable {
    func showError(_: StateInfo) {}
    func hideError() {}
}
