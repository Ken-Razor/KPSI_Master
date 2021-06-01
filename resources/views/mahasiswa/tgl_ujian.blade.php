@extends('../layout_mhs.mhs')
@section('title-mhs')
Jadwal Ujian
@endsection
@section('content')

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <h1 class="h3 mb-4 text-gray-800" style="padding-left:15px;">JADWAL UJIAN</h1>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr class="center">
                                        <th style="width:2%;">No</th>
                                        <th style="width:15%;">Judul</th>
                                        <th style="width:15%;">Pembimbing</th>
                                        <th style="width:15%;">Penguji</th>
                                        <th style="width:10%;">Tanggal</th>
                                        <th style="width:10%;">Jam</th>
                                        <th style="width:10%;">Ruangan</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <tr>
                                    @foreach($dkp as $kp)
                                    @foreach($data as $dt)
                                      <td>{{$loop->iteration}}</td>
                                      <td>{{$kp->judul}}</td>

                                      
                                      
                                      <td>{{$dt->dosbing}}</td>
                                      <td>{{$dt->dosuji}}</td>
                                      <td>{{$dt->tanggal}}</td>
                                      <td>{{$dt->jam}}</td>
                                      <td>{{$dt->ruangan}}</td>
                                    </tr>
                                    @endforeach
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End of Main Content -->
@endsection 