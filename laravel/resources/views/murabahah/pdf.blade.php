<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cetak MBA</title>
    <style>
        html {
            padding: 20px;
            margin-top: 90px;
        }

        img {
            width: 320px;
            margin-right: 20px;
        }

    </style>
</head>

<body>
    @foreach ($mba as $item)
    <img src="{{ asset($item->path) }}" class="img-thumbnail">
    @endforeach
</body>

</html>
