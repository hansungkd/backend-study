const fs = require('fs');
const path = require('path');
const util = require('util')

const readdir = util.promisify(fs.readdir)
const stat = util.promisify(fs.stat)

const findJSfiles = async dir => {
    try {
        const files = await readdir(dir);
        for (const file of files) {
            const filePath = path.join(dir, file);
            const fileStat = await stat(filePath);
            if (fileStat.isDirectory()) {
                await findJSfiles(filePath);
            } else if (path.extname(filePath) === '.js') {
                console.log(filePath);
            }
        }
    }
    catch (error) {
        console.error("An error occured:", error)
    }
};

findJSfiles('./test')