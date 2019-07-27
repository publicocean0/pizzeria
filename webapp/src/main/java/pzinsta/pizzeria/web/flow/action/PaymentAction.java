package pzinsta.pizzeria.web.flow.action;

import com.braintreegateway.BraintreeGateway;
import com.braintreegateway.Result;
import com.braintreegateway.Transaction;
import com.braintreegateway.Transaction.Status;
import com.braintreegateway.TransactionRequest;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.money.MonetaryAmount;
import java.math.BigDecimal;
import java.util.EnumSet;
import java.util.Set;
import java.util.UUID;

@Component
public class PaymentAction {







    public String generateClientToken() {
        return UUID.randomUUID().toString();
    }
public boolean isSuccessful(Object p){
        if (p instanceof Boolean )return (Boolean)p;
        else if (p instanceof String ) return Boolean.getBoolean((String)p);
             return false;
}

    }

