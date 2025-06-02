/**
 * Описание
 * @param {Object} object
 * @param {string} object.example
 * @returns {Promise<{message: string|Object, statusCode: number}>}
 */
async function exampleName(object) {
    const funcName = 'exampleName';
    let data = {
        message: 'error',
        statusCode: 400,
    };

    const params = [ object.example ];
    const query = ``;

    const client = await pool.connect();

    try {
        const result = await client.query(query, params);

        data.message = result.rows;
        data.statusCode = 200;
    }
    catch (error) {
        winston.errorLog(`${ funcName }: CATCH ERROR`);
        winston.errorLog(error.message, error.stack);
    }
    finally {
        client.release();
    }

    return data;
}

