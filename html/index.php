<!DOCTYPE html>
<html>
    <head>
        <link href="index.css" rel="stylesheet" type="text/css" />
        <link href="./css/global.min.css" rel="stylesheet">
        <!--<link href="./css/menu.min.css" rel="stylesheet">-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>proyecto pantalla 2022-2023</title>
    </head>
    <body>
        <div class="container-fluid" style="width: 100%; height: 100%;">
            <div class="row margentop_35" style="width: 100%; height: calc(100% - 35px);">
                <div class="col-md-5" style="height: 100%">
                    <div class="resp_parada" id="resp_parada" style="height: 50%">
                            <?php
                                $url = 'https://www.guaguas.com/js/ajax/consulta_tiempo_parada.php';
                                $data = array('paradas' => '439');

                                $options = array(
                                    'http' => array(
                                        'header'  => "Content-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nX-Requested-With: XMLHttpRequest\r\nReferer: https://www.guaguas.com/lineas/proxima-guagua\r\n",
                                        'method'  => 'POST',
                                        'content' => http_build_query($data)
                                    )
                                );
                                $context  = stream_context_create($options);
                                $result = file_get_contents($url, false, $context);
                                //$frase = gzinflate(substr($result,10,-8));
                                
                                echo $result;
                            ?>
                    </div>
                
                    <div class="resp_parada" id="resp_parada" style="height: 50%">
                        <?php
                            $url = 'https://www.guaguas.com/js/ajax/consulta_tiempo_parada.php';
                            $data = array('paradas' => '407');

                            $options = array(
                                'http' => array(
                                    'header'  => "Content-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nX-Requested-With: XMLHttpRequest\r\nReferer: https://www.guaguas.com/lineas/proxima-guagua\r\n",
                                    'method'  => 'POST',
                                    'content' => http_build_query($data)
                                )
                            );
                            $context  = stream_context_create($options);
                            $result = file_get_contents($url, false, $context);
                            //$frase = gzinflate(substr($result,10,-8));
                            
                            echo $result;
                        ?>
                    </div>
                </div>
                <!--
                <div class="col-md-3" style="height: 100%">
                    <div class="clock">
                        <div class="outer-clock-face">
                            <div class="marking marking-one"></div>
                            <div class="marking marking-two"></div>
                            <div class="marking marking-three"></div>
                            <div class="marking marking-four"></div>
                            <div class="inner-clock-face">
                            <div class="hand hour-hand"></div>
                                <div class="hand min-hand"></div>
                                <div class="hand second-hand"></div>
                            </div>
                        </div>
                    </div>
                </div>-->
                <div class="col-md-7" style="display: flex; flex-flow: column; height: 100%">
                    <div style="">
                        <a class="twitter-timeline" href="https://twitter.com/ieselrincon?ref_src=twsrc%5Etfw" data-tweet-limit="1" data-chrome="nofooter">Tweets by ieselrincon</a>    <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                    </div>
                    <div style="flex-grow: 1; position: relative;">
                        <div class="weather" style="margin: 0; position: relative; top: 50%; -ms-transform: translateY(-50%); transform: translateY(-50%);">
                            <a class="weatherwidget-io" href="https://forecast7.com/es/28d12n15d44/las-palmas-de-gran-canaria/" data-label_1="LAS PALMAS DE GRAN CANARIA" data-label_2="Tiempo" data-theme="original" >LAS PALMAS DE GRAN CANARIA Tiempo</a>
                            <script>
                            !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src='https://weatherwidget.io/js/widget.min.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','weatherwidget-io-js');
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="row" style="width: 100%">
                <div class="span12">
                    <marquee  direction="up">
                        <script>
                            let bookings = ["Reserva G101: "];
                        <?php
                        $servername = "192.168.103.62";
                        $username = "gestor";
                        $password = "gestor";
                        $dbname = "Pantalla";

                        $conn = new mysqli($servername, $username, $password, $dbname);
                        $sql = "SELECT teacher, dateIn, dateOut FROM Bookings"." WHERE DATE(dateIn) = CURDATE() && dateOut > CURTIME()";
                        $result = $conn->query($sql);
                        if ($result->num_rows > 0) {
                            $i = 0;
                            // output data of each row
                            while($row = $result->fetch_assoc()) {
                                $i++;
                                $now = new DateTime("now", new DateTimeZone('Europe/London'));

                                $dateIn = new DateTime($row["dateIn"], new DateTimeZone('Europe/London'));
                                $dateOut = new DateTime($row["dateOut"], new DateTimeZone('Europe/London'));
                                //var_dump($now -> getTimestamp());
                                //var_dump($dateOut);

                                if($now > $dateIn && $now < $dateOut) {
                                    echo "bookings[$i]=[\"<i style='color: lime;'> - ".$row["teacher"].": (".substr($row["dateIn"], 11, 5)." - ".substr($row["dateOut"], 11, 5).")</i>\"];";
                                } else {
                                    echo "bookings[$i]=[\"<i style='color: white;'> - ".$row["teacher"].": (".substr($row["dateIn"], 11, 5)." - ".substr($row["dateOut"], 11, 5).")</i>\"];";
                                }
                            }
                          } else {
                            echo "bookings[0]=\"No hay reservas\";";
                          }
                          $conn->close();
                        ?>
                        </script>
                    </marquee>
                </div>
            </div>
        </footer>
    </body>
</html>
<script type="text/javascript" src="main.js"></script>