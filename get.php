<?php
  $BUCKET_NAME = 'linac';
  $IAM_KEY = 'AKIA4T3AAUE6C4JACXTG';
  $IAM_SECRET = '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';

  require './application/autoload.php';
  use Aws\S3\S3Client;
  use Aws\S3\Exception\S3Exception;

  // Get the access code
  $accessCode = $_GET['c'];
	$accessCode = strtoupper($accessCode);
  $accessCode = trim($accessCode);
  $accessCode = addslashes($accessCode);
  $accessCode = htmlspecialchars($accessCode);

  // Connect to database
  $con = ...

  // Verify valid access code
  $result = mysqli_query($con, "SELECT * FROM s3Files WHERE code='$accessCode'") or die("Error: Invalid request");
  if (mysqli_num_rows($result) != 1) {
    die("Error: Invalid access code");
  }
  
  // Get path from db
  $keyPath = '';
  while($row = mysqli_fetch_array($result)) {
    $keyPath = $row['s3FilePath'];
  }

  // Get file
  try {
    $s3 = S3Client::factory(
      array(
        'credentials' => array(
          'key' => $IAM_KEY,
          'secret' => $IAM_SECRET
        ),
        'version' => 'latest',
        'region'  => 'us-east-2'
      )
    );

    //
    $result = $s3->getObject(array(
      'Bucket' => $BUCKET_NAME,
      'Key'    => $keyPath
    ));


    // Display it in the browser
    header("Content-Type: {$result['ContentType']}");
    header('Content-Disposition: filename="' . basename($keyPath) . '"');
    echo $result['Body'];

  } catch (Exception $e) {
    die("Error: " . $e->getMessage());
  }