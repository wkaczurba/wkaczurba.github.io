import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class Main {

    private static String getSASToken(String resourceUri, String keyName, String key)
    {
        long epoch = System.currentTimeMillis()/1000L;
        int week = 60*60*24*7;
        String expiry = Long.toString(epoch + week);

        String sasToken = null;
        try {
            String stringToSign = URLEncoder.encode(resourceUri, "UTF-8") + "\n" + expiry;
            String signature = getHMAC256(key, stringToSign);
            sasToken = "SharedAccessSignature sr=" + URLEncoder.encode(resourceUri, "UTF-8") +"&sig=" +
                    URLEncoder.encode(signature, "UTF-8") + "&se=" + expiry + "&skn=" + keyName;
        } catch (UnsupportedEncodingException e) {

            e.printStackTrace();
        }

        return sasToken;
    }


    public static String getHMAC256(String key, String input) {
        Mac sha256_HMAC = null;
        String hash = null;
        try {
            sha256_HMAC = Mac.getInstance("HmacSHA256");
            SecretKeySpec secret_key = new SecretKeySpec(key.getBytes(), "HmacSHA256");
            sha256_HMAC.init(secret_key);
            Base64.Encoder encoder = Base64.getEncoder();

            hash = new String(encoder.encode(sha256_HMAC.doFinal(input.getBytes("UTF-8"))));

        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return hash;
    }

    public static void main(String[] args) {
        // WOrking, ok!
        var sasToken = getSASToken("https://sapps-eventdriven-servicebus.servicebus.windows.net/upper-case", "listener", "ZlgMkVC4TmEMpS8QFPth1TrdHC98mb1YL+ASbJuUQeU=");
        System.out.println(sasToken);

//        var sasToken = getSASToken("https://sapps-eventdriven-servicebus.servicebus.windows.net/", "RootManageSharedAccessKey", "wRkQBxJ6eUqRgWdWJVuN4YVuatO0KB7ed+ASbMGrBzc=");
//        System.out.println(sasToken);

        // Worked, ok:
//        curl --location --request POST 'https://sapps-eventdriven-servicebus.servicebus.windows.net/upper-case/messages/head' \
//        --header 'Authorization: SharedAccessSignature sr=https%3A%2F%2Fsapps-eventdriven-servicebus.servicebus.windows.net%2Fupper-case&sig=S1hSqoMTXVrSM5y22IY3LmhlB170R93DAt%2B6DquM2io%3D&se=1693665082&skn=listener' \
//        --header 'Content-Type: application/json'
    }
}