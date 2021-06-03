@extends('../layout_koor.koor')
@section('title-koor')
Verifikasi Surat Keterangan
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
                                      <th scope="col">Status</th>
                                      <th scope="col">Verifikasi</th>

                                    </tr>
                                  </thead>
                                  <tbody>
                                  @foreach($data as $dt)
                                  <tr>
                                    <td>{{$loop->iteration}}</td>
                                    <td>{{$dt->nim}}</td>
                                    <td>{{$dt->lembaga}}</td>
                                    <td>{{$dt->dokumen}} | <a href="/file/sk/{{$dt->id}}">Lihat</a></td>
                                    <td>
                                        @if($dt->status == 3)
                                        <a href="#" class="btn btn-sm btn-warning">Belum diverifikasi</a>
                                        @elseif($dt->status == 1)
                                        <a href="#" class="btn btn-sm btn-success">Setuju</a>
                                        @else
                                        <a href="#" class="btn btn-sm btn-danger">Ditolak</a>
                                        @endif
                                    </td>
                                    <td>
                                        @if($dt->status == 1)
                                        <a href="{{ url('verifikasi/sk/status/' . $dt->id) }}" class="btn btn-sm btn-danger">Tolak</a>
                                        @else
                                        <a href="{{ url('verifikasi/sk/status/' . $dt->id) }}" class="btn btn-sm btn-success">Setuju</a>
                                        @endif
                                    </td>

                                  </tr>
                                  @endforeach
                                  
                                  
                                   

                                       
                                  </tbody>
                    </table>
                    
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
@endsection