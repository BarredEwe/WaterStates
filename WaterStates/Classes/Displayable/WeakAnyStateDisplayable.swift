public class WeakAnyStateDisplayable<T>: StateDisplayable {

    private let _showLoading: (String) -> Void
    private let _hideLoading: () -> Void
    private let _showEmpty: (String?) -> Void
    private let _hideEmpty: () -> Void
    private let _showError: (Error?) -> Void
    private let _hideError: () -> Void
    private let _showContent: (T) -> Void
    private let _hideContent: () -> Void

    init<U: StateDisplayable>(_ statable: U) where U.ContentType == T {
        _showLoading = { [weak statable] type in return statable?.showLoading(type) }
        _hideLoading = { [weak statable] in return statable?.hideLoading() }
        _showEmpty = { [weak statable] type in return statable?.showEmpty(type) }
        _hideEmpty = { [weak statable] in return statable?.hideEmpty() }
        _showError = { [weak statable] error in return statable?.showError(error) }
        _hideError = { [weak statable] in return statable?.hideError() }
        _showContent = { [weak statable] content in return statable?.showContent(content) }
        _hideContent = { [weak statable] in return statable?.hideContent() }
    }

    public func showLoading(_ type: String) {
        _showLoading(type)
    }

    public func hideLoading() {
        _hideLoading()
    }

    public func showEmpty(_ type: String?) {
        _showEmpty(type)
    }

    public func hideEmpty() {
        _hideEmpty()
    }

    public func showError(_ error: Error?) {
        _showError(error)
    }

    public func hideError() {
        _hideError()
    }

    public func showContent(_ content: T) {
        _showContent(content)
    }

    public func hideContent() {
        _hideContent()
    }
}

