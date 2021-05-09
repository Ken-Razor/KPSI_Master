@extends('../layout_dsn.dsn')
@section('title-dosen')
Halaman Utama Dosen
@endsection
@section('content')

                <!-- Begin Page Content -->
                <div class="welcome-area">
                <div class="container-fluid">
                    <div class="row">
                        <!-- ***** Header Text Start ***** -->
                        <div class="container">
                            <h1 class="center">SELAMAT DATANG DI SIKP</h1>
                        </div>
                        <!-- ***** Header Text End ***** -->   

                        <div class="card shadow mb-4 border-bottom-primary">
                            <img src="{{asset('img/xp2.jpg')}}" style="width:100%">
                            <a href="" class="center">DATA BIMBINGAN</a>
                        </div>

                        <div class="card shadow mb-4 border-bottom-primary">
                            <img src="{{asset('img/xp2.jpg')}}" style="width:100%">
                            <a href="" class="center">JADWAL UJIAN</a>
                        </div>
                    </div>
                    </div>
                </div>
            <!-- End of Main Content -->

@endsection