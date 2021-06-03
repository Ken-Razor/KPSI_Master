@extends('../layout_koor.koor')
@section('title-koor')
Daftar Registrasi KP
@endsection
@section('content')

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                   

                    <div class="row">
                      <div class="col-lg-6">
                        <div class="card-body">
                           <h1 class="h3 mb-4 text-gray-800">Daftar PRA KP sudah disetujui </h1>
                           <table class="table table-striped table-hover">
                                  <thead>
                                    <tr>
                                      <!-- <th scope="col">ID  </th> -->
                                      <th scope="col">No</th>
                                      <th scope="col">Nim</th>
                                      

                                    </tr>
                                  </thead>
                                  <tbody>
                                    @foreach($pra as $p)
                                    <tr>
                                      <td>{{$loop->iteration}}</td>
                                      <td>{{$p->nim}}</td>
                                    </tr>
                                    @endforeach
                                                            
                                  </tbody>
                            </table>
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="card-body">
                           <h1 class="h3 mb-4 text-gray-800">Daftar KP sudah disetujui</h1>
                          <table class="table table-striped table-hover">
                                  <thead>
                                    <tr>
                                      <!-- <th scope="col">ID  </th> -->
                                      <th scope="col">No</th>
                                      <th scope="col">Nim</th>
                                      

                                    </tr>
                                  </thead>
                                  <tbody>
                                    @foreach($kp as $k)
                                    <tr>
                                      <td>{{$loop->iteration}}</td>
                                      <td>{{$k->nim}}</td>
                                    </tr>
                                    @endforeach
                                                            
                                  </tbody>
                            </table>
                        </div>
                      </div>

                    </div>

                   
                    
                </div>
                <!-- /.container-fluid -->
                
            </div>
            <!-- End of Main Content -->
@endsection