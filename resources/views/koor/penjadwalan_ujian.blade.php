@extends('../layout_koor.koor')
@section('title-koor')
Penjadwalan Ujian
@endsection
@section('content')

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800"> Jadwal Ujian</h1>

                    <table class="table table-striped table-hover">
                      <thead>
                                    <tr>
                                      <!-- <th scope="col">ID  </th> -->
                                      <th scope="col">No</th>
                                      <th scope="col">Nim</th>
                                      <th scope="col">Judul</th>
                                      <th scope="col">Lembaga</th>
                                      <th scope="col">Aksi</th>

                                    </tr>
                                  </thead>
                                  <tbody>
                                    @foreach($data as $dt)
                                    <tr>
                                      <td>{{$loop->iteration}}</td>
                                      <td>{{$dt->nim}}</td>
                                      <td>{{$dt->judul}}</td>
                                      <td>{{$dt->lembaga}}</td>
                                     <td><a href="/koor/atur/jadwal/ujian/{{$dt->id}}" class="btn btn-sm btn-primary">Atur Jadwal</a>
                                     <a href="/koor/lihat/jadwal/{{$dt->nim}}" class="btn btn-sm btn-info">Lihat Jadwal</a></td>
                                     
                                    </tr>
                                    @endforeach                             
                                  </tbody>
                    </table>
                    
                </div>
                <!-- /.container-fluid -->
                
            </div>
            <!-- End of Main Content -->
@endsection