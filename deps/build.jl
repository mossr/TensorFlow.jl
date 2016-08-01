import Requests

@static if is_apple()
    r = Requests.get("https://malmaud.github.io/files/mac/tensorflow.zip")
    open("downloads/tensorflow.zip", "w") do file
        write(file, r.data)
    end
    run(`unzip -o downloads/tensorflow.zip`)
    run(`mkdir -p bazel-out/local-fastbuild/bin/tensorflow/c`)
    mv("libtensorflow.so", "bazel-out/local-fastbuild/bin/tensorflow/libtensorflow.dylib", remove_destination=true)
    mv("libc_api.so", "bazel-out/local-fastbuild/bin/tensorflow/c/libc_api.dylib", remove_destination=true)
end