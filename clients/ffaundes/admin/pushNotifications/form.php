

<div>
    <form method="post" action="service.php" name="notification">
        <div>
            <label for="notification-title-input">Titulo de la notificación</label>
            <input id="notification-title-input" type="text" name="notification_title">
        </div>
        <div>
            <label for="notification-body-input">Cuerpo de la notificación</label>
            <textarea id="notification-body-input" type="text" name="notification_body">
            </textarea>
        </div>
        <input type="submit" value="Enviar notificación">
    </form>
</div>

<?php


?>