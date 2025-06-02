import mimeTypes from 'mime-types';
import fileDownloader from 'src/scripts/file_downloader';

async downloadFile() {
    try {
        const response = await this.$api.example();
        const data = response.data;
        const mime = response.headers['content-type'];
        const filename = 'Название файла';
        const ext = mimeTypes.extension(mime);
        fileDownloader.downloadFiles(data, `${ filename }.${ ext }`.trim(), mime);
    }
    catch (error) {
        console.error('ERROR TO DOWNLOAD FILE');
        console.error(error);
        this.$error('Произошла ошибка при скачивании файла. Попробуйте позже или обратитесь в техподдержку.');
    }
},

