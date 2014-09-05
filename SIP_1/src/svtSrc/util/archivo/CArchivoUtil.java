package conicet.apps.svt.util.archivo;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;

import conicet.apps.svt.object.archivo.CArchivo;

public class CArchivoUtil {

	public static void descargarArchivo(HttpServletRequest request, HttpServletResponse response, CArchivo f) {
		response.reset();
		response.setHeader("Content-disposition", "attachment; filename=" + f.getNombre().replace(" ", "_") + "; Content-Length: " + f.getTamaño().toString());
		descargarArchivo("application/octet-stream", request, response, f);
	}

	public static void descargarArchivo(HttpServletRequest request, HttpServletResponse response, CArchivo f, String nombreDescarga) {
		response.reset();
		response.setHeader("Content-disposition", "attachment; filename=" + nombreDescarga.replace(" ", "_") + "; Content-Length: " + f.getTamaño().toString());
		descargarArchivo("application/octet-stream", request, response, f);
	}

	private static void descargarArchivo( String contentType, HttpServletRequest request, HttpServletResponse response, CArchivo f) {

		try {

			InputStream in = f.getFile();

			ServletOutputStream out;

			out = response.getOutputStream();

			response.setContentType(contentType);
			// response.setHeader("Content-Length: ", f.getTamaño().toString());

			byte[] outputByte = new byte[4096];
			int read = 0;
			// copy binary content to output stream
			while ((read = in.read(outputByte, 0, 4096)) != -1) {
				out.write(outputByte, 0, 4096);
			}

			in.close();
			out.flush();
			out.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static void descargarArchivoAsContentType(HttpServletRequest request, HttpServletResponse response, CArchivo f) {
		response.reset();
		if(StringUtils.isNotEmpty(f.getTipo())){
			response.setHeader("Content-disposition", "inline; filename=" + f.getNombre().replace(" ", "_") + "; Content-Length: " + f.getTamaño().toString());
			descargarArchivo( f.getTipo(),request, response, f);
		}else{
			descargarArchivo(request, response, f);
		}
	}

    public static InputStream fromByteArrayToInputStream(byte[] fileBlob){
		try{
			if (fileBlob == null) {
				return null;
			}
			return new ByteArrayInputStream(fileBlob);
		}catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public static byte[] fromInputStreamToByteArray(InputStream sourceStream) throws IOException {
		return IOUtils.toByteArray(sourceStream);
	}

}
