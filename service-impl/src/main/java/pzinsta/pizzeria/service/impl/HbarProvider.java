package pzinsta.pizzeria.service.impl;

import java.util.*;

import org.javamoney.moneta.CurrencyUnitBuilder;

import javax.money.MonetaryAmount;
import javax.money.spi.CurrencyProviderSpi;
import javax.money.CurrencyUnit;
import javax.money.CurrencyQuery;

public final class HbarProvider implements CurrencyProviderSpi {

    private Set<CurrencyUnit> bitcoinSet = new HashSet<>();

    public HbarProvider() {
       bitcoinSet.add(CurrencyUnitBuilder.of("HBAR", "MyCurrencyBuilder").build());
       bitcoinSet = Collections.unmodifiableSet(bitcoinSet);
    }

    /**
     * Return a {@link CurrencyUnit} instances matching the given
     * {@link javax.money.CurrencyQuery}.
     *
     * @param query the {@link javax.money.CurrencyQuery} containing the parameters determining the query. not null.
     * @return the corresponding {@link CurrencyUnit}s matching, never null.
     */
    @Override
    public Set<CurrencyUnit> getCurrencies(CurrencyQuery query) {
       // only ensure BTC is the code, or it is a default query.
       if (query.isEmpty()
           || query.getCurrencyCodes().contains("HBAR")
           || query.getCurrencyCodes().isEmpty()) {
           return bitcoinSet;
       }
       return Collections.emptySet();
    }



}