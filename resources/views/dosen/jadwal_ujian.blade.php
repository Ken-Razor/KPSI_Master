@extends('../layout_dsn.dsn')
@section('title-dsn')
Jadwal Ujian
@endsection
@section('content')

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">Jadwal Ujian</h1>

                    <table class="table table-striped table-hover">
                      <thead>
                                    <tr>
                                      <!-- <th scope="col">ID  </th> -->
                                      <th scope="col">No</th>
                                      <th scope="col">Nim</th>
                                      <th scope="col">Pembimbing</th>
                                      <th scope="col">Penguji</th>
                                      <th scope="col">Tanggal</th>
                                      <th scope="col">Jam</th>
                                      <th scope="col">Ruangan</th>
                                      

                                    </tr>
                                  </thead>
                                  <tbody>
                                    @foreach($data as $dt)
                                    <tr>
                                      <td>{{$loop->iteration}}</td>
                                      <td>{{$dt->nim}}</td>
                                      <td>{{$dt->dosbing}}</td>
                                      <td>{{$dt->dosuji}}</td>
                                      <td>{{$dt->tanggal}}</td>
                                      <td>{{$dt->jam}}</td>
                                      <td>{{$dt->ruangan}}</td>
                                    </tr>
                                    @endforeach
                                  
                                  
                                  
                                   

                                       
                                  </tbody>
                    </table>
                    
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
@endsection