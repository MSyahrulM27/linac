 </div>
 <footer style="border-top: 4px solid #FF8C00;  ">
		<div class="container" style="padding-bottom: 50px;">
			<div class="row">
				<div class="col-md-4">
					<h3 style="color: #FF8C00"><b>Kontak Kami</b></h3>
					<p><i class="glyphicon glyphicon-earphone"></i> +628777321456</p>
					<p><i class="glyphicon glyphicon-envelope"></i> linachotel@gmail.com</p>
					<p><i class="glyphicon glyphicon-envelope"></i> @linac_hotel</p>
				</div>
				<div class="col-md-4">
				<h3 style="color: #FF8C00"><b>Fasilitas</b></h3>
					<p><a href=""  style="color: #000">Wifi</a></p>
					<p><a href=""  style="color: #000">Makan Pagi</a></p>
					<p><a href=""  style="color: #000">bathtub</a></p>
					<p><a href=""  style="color: #000">AC</a></p>
				</div>
			</div>
		</div>
		<div class="footer">
			<span>Copyright &copy; 2022, All Rights Reserved by <b>linachotel.com</b></span>
		</div>
	</footer>
 <script src="<?=base_url('assets')?>/js/jquery-3.3.1.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
 <script src="<?=base_url('assets')?>/js/bootstrap.min.js"></script>
 <script type="text/javascript">

 	function addDays(myDate,days) {
 		return new Date(myDate.getTime() + days*24*60*60*1000);
 	}
 	function formatDate(date) {
 		var d = new Date(date),
 		month = '' + (d.getMonth() + 1),
 		day = '' + d.getDate(),
 		year = d.getFullYear();

 		if (month.length < 2) 
 			month = '0' + month;
 		if (day.length < 2) 
 			day = '0' + day;

 		return [year, month, day].join('-');
 	}
 	function tanggalIndo(date){
 		var bulan = ['Januari', 'Februari', 'Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember'];

 		var tanggal = date.getDate();
 		var xbulan = date.getMonth();
 		var xtahun = date.getYear();
 		var bulan = bulan[xbulan];
 		var tahun = (xtahun < 1000)?xtahun + 1900 : xtahun;
 		return tanggal + ' ' + bulan + ' ' + tahun;
 	}
 	function rupiah(bilangan){
 		var	reverse = bilangan.toString().split('').reverse().join(''),
 		ribuan 	= reverse.match(/\d{1,3}/g);
 		ribuan	= ribuan.join('.').split('').reverse().join('');
 		return "Rp. "+ribuan+",-";
 	}
 </script>
</body>
</html>