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
                           <h1 class="h3 mb-4 text-gray-800">Batas Pelaksanaan KP </h1>
                           <a href="/koor/tambah/batas/pelaksaan/kp" class="btn btn-sm btn-primary">Tambah</a>
                           
                              
                              
                              
                            <!-- <a href="/koor/tambah/batas/pelaksaan/kp" class="btn btn-sm btn-danger">Tambah</a> -->
                           <!-- <a href="/koor/tambah/batas/pelaksaan/kp" class="btn btn-sm btn-primary">Tambah</a> -->
                           <!-- <a href="#" class="btn btn-sm btn-warning">Ubah</a> -->
                           <table class="table table-striped table-hover" style="margin-top: 10px">
                                  <thead>
                                    <tr>
                                      <!-- <th scope="col">ID  </th> -->
                                      <th scope="col">No</th>
                                      <th scope="col">Mulai</th>
                                      <th scope="col">Batas</th>
                                      <th scope="col">Aksi</th>
                                      

                                    </tr>
                                  </thead>
                                  <tbody>
                                    @foreach($data as $p)
                                    <tr>
                                      <td>{{$loop->iteration}}</td>
                                      <td>{{$p->mulai}}</td>
                                      <td>{{$p->batas}}</td>
                                      <td><a href="/koor/ubah/batas/pelaksaan/kp/{{$p->id}}" class="btn btn-sm btn-warning">Ubah</a></td>
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