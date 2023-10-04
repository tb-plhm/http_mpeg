CONTAINER_NAME="ffmpeg"

function main() {
    case "$1" in
        "dev")
            docker stop $CONTAINER_NAME
            docker rm $CONTAINER_NAME
            docker build -t ffmpeg -f etc/Dockerfile-dev .
            docker run -it --network=host --name=$CONTAINER_NAME ffmpeg
            ;;
        "prod")
            docker stop $CONTAINER_NAME
            docker rm $CONTAINER_NAME
            docker build -t ffmpeg -f etc/Dockerfile-prod .
            docker run -it --network=host --name=$CONTAINER_NAME ffmpeg
            ;;
        *)
            echo "whaaat ?"
            ;;
    esac
}


main "$@"