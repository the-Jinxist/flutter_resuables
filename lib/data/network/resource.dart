class Resource<T>{

  const Resource(this.ops, this.modelResponse, this.networkError);

  Resource.loading(): _ops = NetworkStatus.LOADING, _modelResponse = null, _networkError = "";

  Resource.idle(): _ops = NetworkStatus.IDLE, _modelResponse = null, _networkError = "";

  Resource.success(this._modelResponse): _ops = NetworkStatus.SUCCESSFUL, _networkError = "";
  
  Resource.failed(this._networkError): _ops = NetworkStatus.SUCCESSFUL, _modelResponse = null;

  final NetworkStatus _ops;
  final T _modelResponse;
  final String _networkError;


}

enum NetworkStatus {
  IDLE, LOADING, SUCCESSFUL, FAILED
}