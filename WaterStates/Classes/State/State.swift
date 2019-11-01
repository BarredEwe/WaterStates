public enum State<T> {
    case loading(String)
    case content(T)
    case error(Error)
    case empty(String)
}
