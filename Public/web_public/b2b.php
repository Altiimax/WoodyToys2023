<!DOCTYPE html>
<html>
    <body>
        <?php
        $host = "192.168.1.9";
        $dbname = "woodytoys";
        $username = "root";
        $password = "Passw0rd!";

        $conn = new mysqli($host, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "SELECT * FROM stock";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            echo "<table><tr><th>ID</th><th>Nom</th><th>Description</th><th>Prix</th></tr>";

            while($row = $result->fetch_assoc()) {
                echo "<tr><td>" . $row["ID"]. "</td><td>" . $row["Nom"]. "</td><td> " . $row["Description"]. "</td><td> " . $row["Prix"].  " €</td></tr>";
            }
            echo "</table>";
        } else {
            echo "Jeux indisponibles";
        }

        $conn->close();
        ?>
    </body>
</html>
