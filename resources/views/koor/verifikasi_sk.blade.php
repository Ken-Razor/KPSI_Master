@extends('../layout_koor.koor')
@section('title-koor')
Verifikasi Surat Keterangab
@endsection
@section('content')

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">PENGAJUAN SURAT KETERANGAN</h1>

                    <table class="table table-striped table-hover">
                      <thead>
                                    <tr>
                                      <!-- <th scope="col">ID  </th> -->
                                      <th scope="col">No</th>
                                      <th scope="col">Nim</th>
                                      <th scope="col">Lembaga</th>
                                      <th scope="col">Dokumen</th>
                                      <th scope="col">Aksi</th>                                      
                                    </tr>
                                  </thead>
                                  <tbody>
                                  @foreach($data as $dt)
                                  <tr>
                                    <td>{{$loop->iteration}}</td>
                                    <td>{{$dt->nim}}</td>
                                    <td>{{$dt->lembaga}}</td>
                                    <td>{{$dt->dokumen}}</td>
                                    <td><a href="dok_sk/{{$dt->dokumen}}" download="{{ $dt->dokumen }}">Lihat</a></td>

                                  </tr>
                                  @endforeach
                                  
                                  
                                   

                                       
                                  </tbody>
                    </table>
                    
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
@endsection