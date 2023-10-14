
public protocol GammaService {
    func gamma()   
}

public protocol GammaServiceProvider {
    var gammaService: GammaService { get }
}