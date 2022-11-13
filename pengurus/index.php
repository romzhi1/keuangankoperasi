<?php include 'header.php'; ?>

<div class="content-wrapper">

  <section class="content-header">
    <h1>
      Dashboard
      <small>Control panel</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Dashboard</li>
    </ol>
  </section>


  <section class="content">

    <div class="row">

      

      <div class="col-xs-6">
        <div class="small-box bg-blue">
          <div class="inner">
            <?php 
            $bulanini = date('m');
            $pemasukan = mysqli_query($koneksi,"SELECT sum(transaksi_nominal) as total_pemasukan FROM transaksi WHERE transaksi_jenis='Pemasukan' and month(transaksi_tanggal)='$bulanini'");
            $p = mysqli_fetch_assoc($pemasukan);
            ?>
            <h4 style="font-weight: bolder"><center><?php echo "Rp. ".number_format($p['total_pemasukan'])." ,-" ?></center></h4>
            <p><center>Pemasukan Bulan Ini</center></p>
          </div>
          <div class="icon">
            <i class="ion ion-stats-bars"></i>
          </div>
          <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>

      <div class="col-lg-3 col-xs-6">
        <div class="small-box bg-blue">
          <div class="inner">
            <?php 
            $tahun = date('Y');
            $pemasukan = mysqli_query($koneksi,"SELECT sum(transaksi_nominal) as total_pemasukan FROM transaksi WHERE transaksi_jenis='Pemasukan' and year(transaksi_tanggal)='$tahun'");
            $p = mysqli_fetch_assoc($pemasukan);
            ?>
            <h4 style="font-weight: bolder"><center><?php echo "Rp. ".number_format($p['total_pemasukan'])." ,-" ?></center></h4>
            <p><center>Pemasukan Tahun Ini</center></p>
          </div>
          <div class="icon">
            <i class="ion ion-stats-bars"></i>
          </div>
          <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>

      <div class="col-lg-3 col-xs-6">
        <div class="small-box bg-black">
          <div class="inner">
            <?php 
            $pemasukan = mysqli_query($koneksi,"SELECT sum(transaksi_nominal) as total_pemasukan FROM transaksi WHERE transaksi_jenis='Pemasukan'");
            $p = mysqli_fetch_assoc($pemasukan);
            ?>
            <h4 style="font-weight: bolder"><center><?php echo "Rp. ".number_format($p['total_pemasukan'])." ,-" ?></center></h4>
            <p><center>Seluruh Pemasukan</center></p>
          </div>
          <div class="icon">
            <i class="ion ion-stats-bars"></i>
          </div>
          <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>
      
      <div class="col-xs-6">
        <div class="small-box bg-red">
          <div class="inner">
            <?php 
            $bulan = date('m');
            $pengeluaran = mysqli_query($koneksi,"SELECT sum(transaksi_nominal) as total_pengeluaran FROM transaksi WHERE transaksi_jenis='pengeluaran' and month(transaksi_tanggal)='$bulan'");
            $p = mysqli_fetch_assoc($pengeluaran);
            ?>
            
            <h4 style="font-weight: bolder"><center><?php echo "Rp. ".number_format($p['total_pengeluaran'])." ,-" ?></center></h4>
            <p><center>Pengeluaran Bulan Ini</center></p>
          </div>
          <div class="icon">
            <i class="ion ion-stats-bars"></i>
          </div>
          <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>

      <div class="col-lg-3 col-xs-6">
        <div class="small-box bg-red">
          <div class="inner">
            <?php 
            $tahun = date('Y');
            $pengeluaran = mysqli_query($koneksi,"SELECT sum(transaksi_nominal) as total_pengeluaran FROM transaksi WHERE transaksi_jenis='pengeluaran' and year(transaksi_tanggal)='$tahun'");
            $p = mysqli_fetch_assoc($pengeluaran);
            ?>
            
            <h4 style="font-weight: bolder"><center><?php echo "Rp. ".number_format($p['total_pengeluaran'])." ,-" ?></center></h4>
            <p><center>Pengeluaran Tahun Ini</center></p>
          </div>
          <div class="icon">
            <i class="ion ion-stats-bars"></i>
          </div>
          <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>

      <div class="col-lg-3 col-xs-6">
        <div class="small-box bg-black">
          <div class="inner">
            <?php 
            $pengeluaran = mysqli_query($koneksi,"SELECT sum(transaksi_nominal) as total_pengeluaran FROM transaksi WHERE transaksi_jenis='pengeluaran'");
            $p = mysqli_fetch_assoc($pengeluaran);
            ?>
            <h4 style="font-weight: bolder"><center><?php echo "Rp. ".number_format($p['total_pengeluaran'])." ,-" ?></center></h4>
            <p><center>Seluruh Pengeluaran</center></p>
          </div>
          <div class="icon">
            <i class="ion ion-stats-bars"></i>
          </div>
          <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>

    </div>
    <!-- /.row -->
    <!-- Main row -->
    <div class="row">

      <!-- Left col -->
      <section class="col-lg-8">

        <div class="nav-tabs-custom">

          <ul class="nav nav-tabs pull-right">
            <!-- <li><a href="#tab2" data-toggle="tab">Pemasukan</a></li> -->
            <li class="active"><a href="#tab1" data-toggle="tab">Pemasukan & Pengeluaran</a></li>
            <li class="pull-left header">Grafik</li>
          </ul>

          <div class="tab-content" style="padding: 20px">

            <div class="chart tab-pane active" id="tab1">

              
              <h4 class="text-center">Grafik Data Pemasukan & Pengeluaran Per <b>Bulan</b></h4>
              <canvas id="grafik1" style="position: relative; height: 300px;"></canvas>

              <br/>
              <br/>
              <br/>

              <h4 class="text-center">Grafik Data Pemasukan & Pengeluaran Per <b>Tahun</b></h4>
              <canvas id="grafik2" style="position: relative; height: 300px;"></canvas>

            </div>
            <div class="chart tab-pane" id="tab2" style="position: relative; height: 300px;">
              
            </div>
          </div>

        </div>

      </section>
     
    </div>
    <!-- /.row (main row) -->

  </section>

</div>

<?php include 'footer.php'; ?>