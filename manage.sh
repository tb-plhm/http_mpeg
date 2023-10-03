CONTAINER_NAME="ffmpeg"

function main() {
    case "$1" in
        "run")
            docker stop $CONTAINER_NAME
            docker rm $CONTAINER_NAME
            docker build -t ffmpeg .
            docker run -it --network=host --name=$CONTAINER_NAME ffmpeg
            ;;
        *)
            echo "whaaat ?"
            ;;
    esac
}


main "$@"